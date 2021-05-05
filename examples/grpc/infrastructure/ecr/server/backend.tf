terraform {
  backend "s3" {
    bucket  = "development-my-tfstate"
    region  = "ap-northeast-1"
    key     = "grpc/ecr/server/terraform.tfstate"
    encrypt = true
  }
}