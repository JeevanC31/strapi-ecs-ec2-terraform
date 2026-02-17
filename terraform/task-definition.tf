resource "aws_ecs_task_definition" "strapi_task" {
  family                   = "strapi-task"
  network_mode             = "bridge"
  requires_compatibilities = ["EC2"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name  = "strapi"
      image = "${aws_ecr_repository.strapi_repo.repository_url}:latest"

      portMappings = [{
        containerPort = 1337
        hostPort      = 1337
      }]

      environment = [
        { name = "DATABASE_CLIENT", value = "postgres" },
        { name = "DATABASE_HOST", value = aws_db_instance.strapi_db.address },
        { name = "DATABASE_PORT", value = "5432" },
        { name = "DATABASE_NAME", value = "strapi" },
        { name = "DATABASE_USERNAME", value = "strapi" },
        { name = "DATABASE_PASSWORD", value = "StrongPassword123" },
        { name = "JWT_SECRET", value = "myJwtSecret" }
      ]
    }
  ])
}
