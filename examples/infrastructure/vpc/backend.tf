terraform {
  backend "s3" {
    bucket  = "development-my-tfstate"
    region  = "ap-northeast-1"
    key     = "vpc/terraform.tfstate"
    encrypt = true
  }
}