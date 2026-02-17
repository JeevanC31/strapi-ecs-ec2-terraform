provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket  = "task7-terraform-state-jeevan"   
    key     = "task7/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}


