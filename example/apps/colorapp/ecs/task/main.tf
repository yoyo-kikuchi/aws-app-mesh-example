data "terraform_remote_state" "ecs_cluster" {
  backend = "s3"
  config = {
    bucket = "development-my-tfstate"
    key    = "ecs-cluster/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "servicemesh" {
  backend = "s3"
  config = {
    bucket = "development-my-tfstate"
    key    = "apps/colorapp/servicemesh/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "ecr_repository" {
  backend = "s3"
  config = {
    bucket = "development-my-tfstate"
    key    = "apps/colorapp/servicemesh/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "ecr_repository_colorteller" {
  backend = "s3"
  config = {
    bucket = "development-my-tfstate"
    key    = "ecr/colorteller/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "ecr_repository_gateway" {
  backend = "s3"
  config = {
    bucket = "development-my-tfstate"
    key    = "ecr/gateway/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

locals {
  ecs_service_log_group = "AppMeshSample"
  app_image             = "${data.terraform_remote_state.ecr_repository_colorteller.outputs.colorteller["repository_url"]}:latest"
  gateway_image         = "${data.terraform_remote_state.ecr_repository_gateway.outputs.gateway["repository_url"]}:latest"
  envoy_image           = "840364872350.dkr.ecr.ap-northeast-1.amazonaws.com/aws-appmesh-envoy:v1.17.2.0-prod"
  envoy_log_level       = "debug"
  services_domain       = "sample.local"
}

module "ecs_task_white" {
  source             = "../../../../../modules/ecs/task"
  family             = "AppMeshSample-ColorTeller-white"
  networkMode        = "awsvpc"
  cpu                = 256
  memory             = 512
  task_role_arn      = data.terraform_remote_state.ecs_cluster.outputs.task_iam_role["arn"]
  execution_role_arn = data.terraform_remote_state.ecs_cluster.outputs.task_execution_iam_role["arn"]
  requires_compatibilities = [
    "FARGATE"
  ]
  container_definitions = templatefile("task_definitions/teller.json", {
    APP_IMAGE                   = local.app_image,
    COLOR                       = "white",
    STAGE                       = ""
    ECS_SERVICE_LOG_GROUP       = local.ecs_service_log_group
    AWS_REGION                  = "ap-northeast-1"
    AWS_LOG_STREAM_PREFIX_APP   = "colorteller-white-app"
    AWS_LOG_STREAM_PREFIX_ENVOY = "colorteller-white-envoy"
    AWS_LOG_STREAM_PREFIX_XRAY  = "colorteller-white-xray"
    ENVOY_IMAGE                 = local.envoy_image
    VIRTUAL_NODE                = data.terraform_remote_state.servicemesh.outputs.color_white_virtual_node["arn"]
    ENVOY_LOG_LEVEL             = local.envoy_log_level
    APPMESH_XDS_ENDPOINT        = ""
  })
  is_proxy_configuration             = true
  proxy_configuration_container_name = "envoy"
  proxy_configuration_type           = "APPMESH"
  ignored_uid                        = "1337"
  proxy_ingress_port                 = 15000
  proxy_egress_port                  = 15001
  proxy_app_port                     = "9080"
  egress_ignored_ips                 = "169.254.170.2,169.254.169.254"
}

module "ecs_task_blue" {
  source             = "../../../../../modules/ecs/task"
  family             = "AppMeshSample-ColorTeller-blue"
  networkMode        = "awsvpc"
  cpu                = 256
  memory             = 512
  task_role_arn      = data.terraform_remote_state.ecs_cluster.outputs.task_iam_role["arn"]
  execution_role_arn = data.terraform_remote_state.ecs_cluster.outputs.task_execution_iam_role["arn"]
  requires_compatibilities = [
    "FARGATE"
  ]
  container_definitions = templatefile("task_definitions/teller.json", {
    APP_IMAGE                   = local.app_image,
    COLOR                       = "blue",
    STAGE                       = ""
    ECS_SERVICE_LOG_GROUP       = local.ecs_service_log_group
    AWS_REGION                  = "ap-northeast-1"
    AWS_LOG_STREAM_PREFIX_APP   = "colorteller-blue-app"
    AWS_LOG_STREAM_PREFIX_ENVOY = "colorteller-blue-envoy"
    AWS_LOG_STREAM_PREFIX_XRAY  = "colorteller-blue-xray"
    ENVOY_IMAGE                 = local.envoy_image
    VIRTUAL_NODE                = data.terraform_remote_state.servicemesh.outputs.color_blue_virtual_node["arn"]
    ENVOY_LOG_LEVEL             = local.envoy_log_level
    APPMESH_XDS_ENDPOINT        = ""
  })
  is_proxy_configuration             = true
  proxy_configuration_container_name = "envoy"
  proxy_configuration_type           = "APPMESH"
  ignored_uid                        = "1337"
  proxy_ingress_port                 = 15000
  proxy_egress_port                  = 15001
  proxy_app_port                     = "9080"
  egress_ignored_ips                 = "169.254.170.2,169.254.169.254"
}

module "ecs_task_red" {
  source             = "../../../../../modules/ecs/task"
  family             = "AppMeshSample-ColorTeller-red"
  networkMode        = "awsvpc"
  cpu                = 256
  memory             = 512
  task_role_arn      = data.terraform_remote_state.ecs_cluster.outputs.task_iam_role["arn"]
  execution_role_arn = data.terraform_remote_state.ecs_cluster.outputs.task_execution_iam_role["arn"]
  requires_compatibilities = [
    "FARGATE"
  ]
  container_definitions = templatefile("task_definitions/teller.json", {
    APP_IMAGE                   = local.app_image,
    COLOR                       = "red",
    STAGE                       = ""
    ECS_SERVICE_LOG_GROUP       = local.ecs_service_log_group
    AWS_REGION                  = "ap-northeast-1"
    AWS_LOG_STREAM_PREFIX_APP   = "colorteller-red-app"
    AWS_LOG_STREAM_PREFIX_ENVOY = "colorteller-red-envoy"
    AWS_LOG_STREAM_PREFIX_XRAY  = "colorteller-red-xray"
    ENVOY_IMAGE                 = local.envoy_image
    VIRTUAL_NODE                = data.terraform_remote_state.servicemesh.outputs.color_red_virtual_node["arn"]
    ENVOY_LOG_LEVEL             = local.envoy_log_level
    APPMESH_XDS_ENDPOINT        = ""
  })
  is_proxy_configuration             = true
  proxy_configuration_container_name = "envoy"
  proxy_configuration_type           = "APPMESH"
  ignored_uid                        = "1337"
  proxy_ingress_port                 = 15000
  proxy_egress_port                  = 15001
  proxy_app_port                     = "9080"
  egress_ignored_ips                 = "169.254.170.2,169.254.169.254"
}

module "ecs_task_black" {
  source             = "../../../../../modules/ecs/task"
  family             = "AppMeshSample-ColorTeller-black"
  networkMode        = "awsvpc"
  cpu                = 256
  memory             = 512
  task_role_arn      = data.terraform_remote_state.ecs_cluster.outputs.task_iam_role["arn"]
  execution_role_arn = data.terraform_remote_state.ecs_cluster.outputs.task_execution_iam_role["arn"]
  requires_compatibilities = [
    "FARGATE"
  ]
  container_definitions = templatefile("task_definitions/teller.json", {
    APP_IMAGE                   = local.app_image
    COLOR                       = "black"
    STAGE                       = ""
    ECS_SERVICE_LOG_GROUP       = local.ecs_service_log_group
    AWS_REGION                  = "ap-northeast-1"
    AWS_LOG_STREAM_PREFIX_APP   = "colorteller-black-app"
    AWS_LOG_STREAM_PREFIX_ENVOY = "colorteller-black-envoy"
    AWS_LOG_STREAM_PREFIX_XRAY  = "colorteller-black-xray"
    ENVOY_IMAGE                 = local.envoy_image
    VIRTUAL_NODE                = data.terraform_remote_state.servicemesh.outputs.color_black_virtual_node["arn"]
    ENVOY_LOG_LEVEL             = local.envoy_log_level
    APPMESH_XDS_ENDPOINT        = ""
  })
  is_proxy_configuration             = true
  proxy_configuration_container_name = "envoy"
  proxy_configuration_type           = "APPMESH"
  ignored_uid                        = "1337"
  proxy_ingress_port                 = 15000
  proxy_egress_port                  = 15001
  proxy_app_port                     = "9080"
  egress_ignored_ips                 = "169.254.170.2,169.254.169.254"
}


module "ecs_task_gateway" {
  source             = "../../../../../modules/ecs/task"
  family             = "AppMeshSample-ColorGateway"
  networkMode        = "awsvpc"
  cpu                = 256
  memory             = 512
  task_role_arn      = data.terraform_remote_state.ecs_cluster.outputs.task_iam_role["arn"]
  execution_role_arn = data.terraform_remote_state.ecs_cluster.outputs.task_execution_iam_role["arn"]
  requires_compatibilities = [
    "FARGATE"
  ]
  container_definitions = templatefile("task_definitions/gateway.json", {
    APP_IMAGE                   = local.gateway_image
    COLOR_TELLER_ENDPOINT       = "colorteller.${local.services_domain}:9080"
    TCP_ECHO_ENDPOINT           = "tcpecho.${local.services_domain}:2701"
    STAGE                       = ""
    ECS_SERVICE_LOG_GROUP       = local.ecs_service_log_group
    AWS_REGION                  = "ap-northeast-1"
    AWS_LOG_STREAM_PREFIX_APP   = "colorgateway-app"
    AWS_LOG_STREAM_PREFIX_ENVOY = "colorgateway-envoy"
    AWS_LOG_STREAM_PREFIX_XRAY  = "colorgateway-xray"
    ENVOY_IMAGE                 = local.envoy_image
    VIRTUAL_NODE                = data.terraform_remote_state.servicemesh.outputs.color_gateway_virtual_node["arn"]
    ENVOY_LOG_LEVEL             = local.envoy_log_level
    APPMESH_XDS_ENDPOINT        = ""
  })
  is_proxy_configuration             = true
  proxy_configuration_container_name = "envoy"
  proxy_configuration_type           = "APPMESH"
  ignored_uid                        = "1337"
  proxy_ingress_port                 = 15000
  proxy_egress_port                  = 15001
  proxy_app_port                     = "9080"
  egress_ignored_ips                 = "169.254.170.2,169.254.169.254"
}

module "ecs_task_tcpecho" {
  source             = "../../../../../modules/ecs/task"
  family             = "AppMeshSample-TcpEcho"
  networkMode        = "awsvpc"
  cpu                = 256
  memory             = 512
  task_role_arn      = data.terraform_remote_state.ecs_cluster.outputs.task_iam_role["arn"]
  execution_role_arn = data.terraform_remote_state.ecs_cluster.outputs.task_execution_iam_role["arn"]
  requires_compatibilities = [
    "FARGATE"
  ]
  container_definitions = jsonencode([
    {
      name      = "app"
      image     = "cjimti/go-echo"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 2701
          hostPort      = 2701
        }
      ]
      environment = [
        {
          name  = "TCP_PORT"
          value = "2701"
        },
        {
          name  = "NODE_NAME"
          value = "mesh/sample-local/virtualNode/tcpecho-vn"
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = local.ecs_service_log_group
          awslogs-region        = "ap-northeast-1"
          awslogs-stream-prefix = "tcpecho-app"
        }
      }
    }
  ])
}
