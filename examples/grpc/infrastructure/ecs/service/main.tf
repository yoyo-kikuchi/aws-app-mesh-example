data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "development-my-tfstate"
    key    = "vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "service_discovery" {
  backend = "s3"
  config = {
    bucket = "development-my-tfstate"
    key    = "grpc/service_discovery/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "ecs_cluster" {
  backend = "s3"
  config = {
    bucket = "development-my-tfstate"
    key    = "grpc/ecs/cluster/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "ecs_task" {
  backend = "s3"
  config = {
    bucket = "development-my-tfstate"
    key    = "grpc/ecs/task/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

module "color_client_registry" {
  source            = "../../../../../modules/service_discovery/service"
  name              = "color_client"
  namespace_id      = data.terraform_remote_state.service_discovery.outputs.ecs_service_discovery_namespace["id"]
  dns_records_ttl   = 300
  dns_records_type  = "A"
  failure_threshold = 1
}

module "color_client_service" {
  source                             = "../../../../../modules/ecs/service"
  name                               = "client"
  cluster                            = data.terraform_remote_state.ecs_cluster.outputs.grpc_cluster["id"]
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  desired_count                      = 1
  launch_type                        = "FARGATE"
  registry_arn                       = module.color_client_registry.template.arn
  assign_public_ip                   = false
  security_groups = [
    data.terraform_remote_state.ecs_cluster.outputs.security_group["id"]
  ]
  subnets = [
    data.terraform_remote_state.vpc.outputs.private_subnet_a["id"],
    data.terraform_remote_state.vpc.outputs.private_subnet_c["id"]
  ]
  task_definition                = data.terraform_remote_state.ecs_task.outputs.ecs_task_client["arn"]
  load_balancer                  = true
  load_balancer_target_group_arn = module.target_group.template.arn
  load_balancer_container_port   = 8080
  load_balancer_container_name   = "app"
  depends_on = [
    module.color_client_registry,
  ]
}

module "color_server_registry" {
  source            = "../../../../../modules/service_discovery/service"
  name              = "color_server"
  namespace_id      = data.terraform_remote_state.service_discovery.outputs.ecs_service_discovery_namespace["id"]
  dns_records_ttl   = 300
  dns_records_type  = "A"
  failure_threshold = 1
}

module "color_server_service" {
  source                             = "../../../../../modules/ecs/service"
  name                               = "server"
  cluster                            = data.terraform_remote_state.ecs_cluster.outputs.grpc_cluster["id"]
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  desired_count                      = 1
  launch_type                        = "FARGATE"
  registry_arn                       = module.color_server_registry.template.arn
  assign_public_ip                   = false
  security_groups = [
    data.terraform_remote_state.ecs_cluster.outputs.security_group["id"]
  ]
  subnets = [
    data.terraform_remote_state.vpc.outputs.private_subnet_a["id"],
    data.terraform_remote_state.vpc.outputs.private_subnet_c["id"]
  ]
  task_definition = data.terraform_remote_state.ecs_task.outputs.ecs_task_server["arn"]
  load_balancer   = false
  depends_on = [
    module.color_server_registry,
  ]
}

module "public_alb_sg" {
  source      = "../../../../../modules/security_group"
  name        = "howto_grpc_alb_sg"
  description = "Access to the public facing load balancer"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc01["id"]
  ingress_cidr_blocks = [
    "0.0.0.0/0"
  ]
}

module "public_load_balancer" {
  source   = "../../../../../modules/lb_v2/lb"
  name     = "howto-grpc-alb"
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
  name                             = "howto-grpc-webtarget"
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