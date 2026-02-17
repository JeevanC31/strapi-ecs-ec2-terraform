variable "region" {
  default = "us-east-1"
}

variable "db_password" {
  sensitive = true
}

variable "project_name" {
  default = "t7-strapi"
}
