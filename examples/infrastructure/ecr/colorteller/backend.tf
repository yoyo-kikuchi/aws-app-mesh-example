terraform {
  backend "s3" {
    bucket  = "development-my-tfstate"
    region  = "ap-northeast-1"
    key     = "ecr/colorteller/terraform.tfstate"
    encrypt = true
  }
}