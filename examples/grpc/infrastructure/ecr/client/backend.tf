terraform {
  backend "s3" {
    bucket  = "development-my-tfstate"
    region  = "ap-northeast-1"
    key     = "grpc/ecr/client/terraform.tfstate"
    encrypt = true
  }
}