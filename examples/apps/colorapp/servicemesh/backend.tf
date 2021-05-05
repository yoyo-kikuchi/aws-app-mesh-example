terraform {
  backend "s3" {
    bucket  = "development-my-tfstate"
    region  = "ap-northeast-1"
    key     = "apps/colorapp/servicemesh/terraform.tfstate"
    encrypt = true
  }
}