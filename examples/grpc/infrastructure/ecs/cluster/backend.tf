terraform {
  backend "s3" {
    bucket  = "development-my-tfstate"
    region  = "ap-northeast-1"
    key     = "grpc/ecs/cluster/terraform.tfstate"
    encrypt = true
  }
}