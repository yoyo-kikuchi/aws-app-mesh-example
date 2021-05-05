data "terraform_remote_state" "ecs_cluster" {
  backend = "s3"
  config = {
    bucket = "development-my-tfstate"
    key    = "ecs-cluster/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "development-my-tfstate"
    key    = "vpc/terraform.tfstate"
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

data "terraform_remote_state" "ecs_task" {
  backend = "s3"
  config = {
    bucket = "development-my-tfstate"
    key    = "apps/colorapp/ecs/task/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

module "white_service_discovery_record" {
  source            = "../../../../../modules/service_discovery/service"
  name              = "colorteller"
  namespace_id      = data.terraform_remote_state.ecs_cluster.outputs.ecs_service_discovery_namespace["id"]
  dns_records_ttl   = 300
  dns_records_type  = "A"
  failure_threshold = 1
}

module "ecs_service_white" {
  source                             = "../../../../../modules/ecs/service"
  name                               = "colorteller-white"
  cluster                            = data.terraform_remote_state.ecs_cluster.outputs.sample_mesh_cluster["id"]
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  desired_count                      = 1
  launch_type                        = "FARGATE"
  registry_arn                       = module.white_service_discovery_record.template.arn
  assign_public_ip                   = false
  security_groups = [
    data.terraform_remote_state.ecs_cluster.outputs.security_group["id"]
  ]
  subnets = [
    data.terraform_remote_state.vpc.outputs.private_subnet_a["id"],
    data.terraform_remote_state.vpc.outputs.private_subnet_c["id"]
  ]
  task_definition = data.terraform_remote_state.ecs_task.outputs.ecs_task_white["arn"]
  load_balancer   = false
  depends_on = [
    module.white_service_discovery_record,
  ]
}

module "blue_service_discovery_record" {
  source            = "../../../../../modules/service_discovery/service"
  name              = "colorteller-blue"
  namespace_id      = data.terraform_remote_state.ecs_cluster.outputs.ecs_service_discovery_namespace["id"]
  dns_records_ttl   = 300
  dns_records_type  = "A"
  failure_threshold = 1
}

module "ecs_service_blue" {
  source                             = "../../../../../modules/ecs/service"
  name                               = "colorteller-blue"
  cluster                            = data.terraform_remote_state.ecs_cluster.outputs.sample_mesh_cluster["id"]
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  desired_count                      = 1
  launch_type                        = "FARGATE"
  registry_arn                       = module.blue_service_discovery_record.template.arn
  assign_public_ip                   = false
  security_groups = [
    data.terraform_remote_state.ecs_cluster.outputs.security_group["id"]
  ]
  subnets = [
    data.terraform_remote_state.vpc.outputs.private_subnet_a["id"],
    data.terraform_remote_state.vpc.outputs.private_subnet_c["id"]
  ]
  task_definition = data.terraform_remote_state.ecs_task.outputs.ecs_task_blue["arn"]
  load_balancer   = false
  depends_on = [
    module.blue_service_discovery_record,
  ]
}

module "red_service_discovery_record" {
  source            = "../../../../../modules/service_discovery/service"
  name              = "colorteller-red"
  namespace_id      = data.terraform_remote_state.ecs_cluster.outputs.ecs_service_discovery_namespace["id"]
  dns_records_ttl   = 300
  dns_records_type  = "A"
  failure_threshold = 1
}

module "ecs_service_red" {
  source                             = "../../../../../modules/ecs/service"
  name                               = "colorteller-red"
  cluster                            = data.terraform_remote_state.ecs_cluster.outputs.sample_mesh_cluster["id"]
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  desired_count                      = 1
  launch_type                        = "FARGATE"
  registry_arn                       = module.red_service_discovery_record.template.arn
  assign_public_ip                   = false
  security_groups = [
    data.terraform_remote_state.ecs_cluster.outputs.security_group["id"]
  ]
  subnets = [
    data.terraform_remote_state.vpc.outputs.private_subnet_a["id"],
    data.terraform_remote_state.vpc.outputs.private_subnet_c["id"]
  ]
  task_definition = data.terraform_remote_state.ecs_task.outputs.ecs_task_red["arn"]
  load_balancer   = false
  depends_on = [
    module.red_service_discovery_record,
  ]
}

module "black_service_discovery_record" {
  source            = "../../../../../modules/service_discovery/service"
  name              = "colorteller-black"
  namespace_id      = data.terraform_remote_state.ecs_cluster.outputs.ecs_service_discovery_namespace["id"]
  dns_records_ttl   = 300
  dns_records_type  = "A"
  failure_threshold = 1
}

module "ecs_service_black" {
  source                             = "../../../../../modules/ecs/service"
  name                               = "colorteller-black"
  cluster                            = data.terraform_remote_state.ecs_cluster.outputs.sample_mesh_cluster["id"]
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  desired_count                      = 1
  launch_type                        = "FARGATE"
  registry_arn                       = module.black_service_discovery_record.template.arn
  assign_public_ip                   = false
  security_groups = [
    data.terraform_remote_state.ecs_cluster.outputs.security_group["id"]
  ]
  subnets = [
    data.terraform_remote_state.vpc.outputs.private_subnet_a["id"],
    data.terraform_remote_state.vpc.outputs.private_subnet_c["id"]
  ]
  task_definition = data.terraform_remote_state.ecs_task.outputs.ecs_task_black["arn"]
  load_balancer   = false
  depends_on = [
    module.black_service_discovery_record,
  ]
}

module "gateway_service_discovery_record" {
  source            = "../../../../../modules/service_discovery/service"
  name              = "colorgateway"
  namespace_id      = data.terraform_remote_state.ecs_cluster.outputs.ecs_service_discovery_namespace["id"]
  dns_records_ttl   = 300
  dns_records_type  = "A"
  failure_threshold = 1
}

module "ecs_service_gateway" {
  source                             = "../../../../../modules/ecs/service"
  name                               = "gateway"
  cluster                            = data.terraform_remote_state.ecs_cluster.outputs.sample_mesh_cluster["id"]
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  desired_count                      = 1
  launch_type                        = "FARGATE"
  registry_arn                       = module.gateway_service_discovery_record.template.arn
  assign_public_ip                   = false
  security_groups = [
    data.terraform_remote_state.ecs_cluster.outputs.security_group["id"]
  ]
  subnets = [
    data.terraform_remote_state.vpc.outputs.private_subnet_a["id"],
    data.terraform_remote_state.vpc.outputs.private_subnet_c["id"]
  ]
  task_definition                = data.terraform_remote_state.ecs_task.outputs.ecs_task_gateway["arn"]
  load_balancer                  = true
  load_balancer_target_group_arn = module.target_group.template.arn
  load_balancer_container_port   = 9080
  load_balancer_container_name   = "app"
  depends_on = [
    module.gateway_service_discovery_record,
    module.target_group
  ]
}

module "echo_service_discovery_record" {
  source            = "../../../../../modules/service_discovery/service"
  name              = "tcpecho"
  namespace_id      = data.terraform_remote_state.ecs_cluster.outputs.ecs_service_discovery_namespace["id"]
  dns_records_ttl   = 300
  dns_records_type  = "A"
  failure_threshold = 1
}

module "ecs_service_echo" {
  source                             = "../../../../../modules/ecs/service"
  name                               = "tcpecho"
  cluster                            = data.terraform_remote_state.ecs_cluster.outputs.sample_mesh_cluster["id"]
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  desired_count                      = 1
  launch_type                        = "FARGATE"
  registry_arn                       = module.echo_service_discovery_record.template.arn
  assign_public_ip                   = false
  security_groups = [
    data.terraform_remote_state.ecs_cluster.outputs.security_group["id"]
  ]
  subnets = [
    data.terraform_remote_state.vpc.outputs.private_subnet_a["id"],
    data.terraform_remote_state.vpc.outputs.private_subnet_c["id"]
  ]
  task_definition = data.terraform_remote_state.ecs_task.outputs.ecs_task_tcpecho["arn"]
  depends_on = [
    module.echo_service_discovery_record,
  ]
}

module "public_alb_sg" {
  source      = "../../../../../modules/security_group"
  name        = "sample_mesh_alb_sg"
  description = "Access to the public facing load balancer"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc01["id"]
  ingress_cidr_blocks = [
    "0.0.0.0/0"
  ]
}

module "public_load_balancer" {
  source   = "../../../../../modules/lb_v2/lb"
  name     = "colorteller-alb"
  internal = false
  subnets = [
    data.terraform_remote_state.vpc.outputs.public_subnet_a["id"],
    data.terraform_remote_state.vpc.outputs.public_subnet_c["id"]
  ]
  security_groups = [
    module.public_alb_sg.template.id,
  ]
  idle_timeout = 30
  depends_on = [
    module.public_alb_sg,
  ]
}

module "target_group" {
  source                           = "../../../../../modules/lb_v2/target_group"
  name                             = "colorteller"
  port                             = 80
  protocol                         = "HTTP"
  target_type                      = "ip"
  vpc_id                           = data.terraform_remote_state.vpc.outputs.vpc01["id"]
  health_check_unhealthy_threshold = 2
  deregistration_delay             = 120
  health_check_interval            = 6
  health_check_path                = "/ping"
  health_check_protocol            = "HTTP"
  health_check_timeout             = 5
  health_check_healthy_threshold   = 2
}

module "alb_listener" {
  source                          = "../../../../../modules/lb_v2/listener"
  load_balancer_arn               = module.public_load_balancer.template.arn
  port                            = 80
  protocol                        = "HTTP"
  default_action_type             = "forward"
  default_action_target_group_arn = module.target_group.template.arn
  depends_on = [
    module.target_group,
    module.public_load_balancer
  ]
}

module "load_balancer_rule" {
  source                  = "../../../../../modules/lb_v2/listener_rule"
  listener_arn            = module.alb_listener.template.arn
  priority                = 1
  action_type             = "forward"
  action_target_group_arn = module.target_group.template.arn
  path_pattern            = ["*"]
  depends_on = [
    module.target_group,
    module.alb_listener
  ]
}