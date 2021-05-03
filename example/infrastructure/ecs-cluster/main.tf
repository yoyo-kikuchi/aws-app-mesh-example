data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "development-my-tfstate"
    key    = "vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

module "sample_mesh_cluster" {
  source = "../../../modules/ecs/cluster"
  name   = "AppMeshSample"
}

module "security_group" {
  source      = "../../../modules/security_group"
  name        = "sample_mesh_ecs_service_sg"
  description = "Security group for the service"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc01["id"]
  ingress_cidr_blocks = [
    data.terraform_remote_state.vpc.outputs.vpc01["cidr_block"]
  ]
}

module "task_iam_role" {
  source             = "../../../modules/iam_role"
  name               = "SampleMeshECSTaskRole"
  assume_role_policy = file("roles/task.json")
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/CloudWatchFullAccess",
    "arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess"
  ]
  path = "/"
}

module "task_execution_iam_role" {
  source             = "../../../modules/iam_role"
  name               = "SampleMeshTaskExecutionRole"
  assume_role_policy = file("roles/task-execution.json")
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
  ]
  path = "/"
}

module "ecs_service_log_group" {
  source            = "../../../modules/cloudwatch/log_group"
  name              = "ECSAppMeshSample"
  retention_in_days = 30
}

module "ecs_service_discovery_namespace" {
  source = "../../../modules/service_discovery/private_dns_namespace"
  name   = "sample.local"
  vpc    = data.terraform_remote_state.vpc.outputs.vpc01["id"]
}