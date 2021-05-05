data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "development-my-tfstate"
    key    = "vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

module "ecs_service_discovery_namespace" {
  source = "../../../../modules/service_discovery/private_dns_namespace"
  name   = "howto-grpc.local"
  vpc    = data.terraform_remote_state.vpc.outputs.vpc01["id"]
}