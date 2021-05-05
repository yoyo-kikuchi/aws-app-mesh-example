terraform {
  backend "s3" {
    bucket  = "development-my-tfstate"
    region  = "ap-northeast-1"
    key     = "appmesh-mesh/terraform.tfstate"
    encrypt = true
  }
}