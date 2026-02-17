resource "aws_ecr_repository" "strapi_repo" {
  name = "t7-strapi-app"

  image_scanning_configuration {
    scan_on_push = true
  }
}
