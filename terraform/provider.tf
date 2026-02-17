provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket  = "task7-terraform-state-jeevan-811738710312"
    key     = "task7/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

