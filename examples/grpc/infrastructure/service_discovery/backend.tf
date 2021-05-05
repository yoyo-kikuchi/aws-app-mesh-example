terraform {
  backend "s3" {
    bucket  = "development-my-tfstate"
    region  = "ap-northeast-1"
    key     = "grpc/service_discovery/terraform.tfstate"
    encrypt = true
  }
}