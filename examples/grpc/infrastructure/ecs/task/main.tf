data "terraform_remote_state" "ecs_cluster" {
  backend = "s3"
  config = {
    bucket = "development-my-tfstate"
    key    = "grpc/ecs/cluster/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "servicemesh" {
  backend = "s3"
  config = {
    bucket = "development-my-tfstate"
    key    = "grpc/mesh/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "ecr_repository_client" {
  backend = "s3"
  config = {
    bucket = "development-my-tfstate"
    key    = "grpc/ecr/client/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "ecr_repository_server" {
  backend = "s3"
  config = {
    bucket = "development-my-tfstate"
    key    = "grpc/ecr/server/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

locals {
  ecs_service_log_group = "howto-grpc-log-group"
  client_image          = "${data.terraform_remote_state.ecr_repository_client.outputs.client["repository_url"]}:latest"
  server_image          = "${data.terraform_remote_state.ecr_repository_server.outputs.server["repository_url"]}:latest"
  envoy_image           = "840364872350.dkr.ecr.ap-northeast-1.amazonaws.com/aws-appmesh-envoy:v1.17.2.0-prod"
  envoy_log_level       = "debug"
  services_domain       = "howto-grpc.local"
}

module "ecs_task_client" {
  source             = "../../../../../modules/ecs/task"
  family             = "color_client"
  networkMode        = "awsvpc"
  cpu                = 256
  memory             = 512
  task_role_arn      = data.terraform_remote_state.ecs_cluster.outputs.task_iam_role["arn"]
  execution_role_arn = data.terraform_remote_state.ecs_cluster.outputs.task_execution_iam_role["arn"]
  requires_compatibilities = [
    "FARGATE"
  ]
  container_definitions = templatefile("task_definitions/client.json", {
    APP_IMAGE                   = local.client_image,
    ECS_SERVICE_LOG_GROUP       = local.ecs_service_log_group
    AWS_REGION                  = "ap-northeast-1"
    AWS_LOG_STREAM_PREFIX_APP   = "color_client"
    AWS_LOG_STREAM_PREFIX_ENVOY = "color_client-envoy"
    ENVOY_IMAGE                 = local.envoy_image
    VIRTUAL_NODE                = data.terraform_remote_state.servicemesh.outputs.color_client_node["arn"]
    ENVOY_LOG_LEVEL             = local.envoy_log_level
    APPMESH_XDS_ENDPOINT        = ""
  })
  is_proxy_configuration             = true
  proxy_configuration_container_name = "envoy"
  proxy_configuration_type           = "APPMESH"
  ignored_uid                        = "1337"
  proxy_ingress_port                 = 15000
  proxy_egress_port                  = 15001
  proxy_app_port                     = "8080"
  egress_ignored_ips                 = "169.254.170.2,169.254.169.254"
}


module "ecs_task_server" {
  source             = "../../../../../modules/ecs/task"
  family             = "color_server"
  networkMode        = "awsvpc"
  cpu                = 256
  memory             = 512
  task_role_arn      = data.terraform_remote_state.ecs_cluster.outputs.task_iam_role["arn"]
  execution_role_arn = data.terraform_remote_state.ecs_cluster.outputs.task_execution_iam_role["arn"]
  requires_compatibilities = [
    "FARGATE"
  ]
  container_definitions = templatefile("task_definitions/server.json", {
    APP_IMAGE                   = local.server_image
    COLOR_TELLER_ENDPOINT       = "colorteller.${local.services_domain}:9080"
    TCP_ECHO_ENDPOINT           = "tcpecho.${local.services_domain}:2701"
    STAGE                       = ""
    ECS_SERVICE_LOG_GROUP       = local.ecs_service_log_group
    AWS_REGION                  = "ap-northeast-1"
    AWS_LOG_STREAM_PREFIX_APP   = "color_server"
    AWS_LOG_STREAM_PREFIX_ENVOY = "color_server-envoy"
    ENVOY_IMAGE                 = local.envoy_image
    VIRTUAL_NODE                = data.terraform_remote_state.servicemesh.outputs.color_server_node["arn"]
    ENVOY_LOG_LEVEL             = local.envoy_log_level
    APPMESH_XDS_ENDPOINT        = ""
  })
  is_proxy_configuration             = true
  proxy_configuration_container_name = "envoy"
  proxy_configuration_type           = "APPMESH"
  ignored_uid                        = "1337"
  proxy_ingress_port                 = 15000
  proxy_egress_port                  = 15001
  proxy_app_port                     = "8080"
  egress_ignored_ips                 = "169.254.170.2,169.254.169.254"
}


