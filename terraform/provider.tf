provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "task7/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
