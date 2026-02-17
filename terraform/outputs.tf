
output "ecr_repository_url" {
  description = "ECR repository URL"
  value       = aws_ecr_repository.strapi_repo.repository_url
}


output "ecs_cluster_name" {
  description = "ECS Cluster Name"
  value       = aws_ecs_cluster.strapi_cluster.name
}


output "ecs_service_name" {
  description = "ECS Service Name"
  value       = aws_ecs_service.strapi_service.name
}


output "rds_endpoint" {
  description = "RDS Endpoint"
  value       = aws_db_instance.strapi_db.address
}


output "rds_port" {
  description = "RDS Port"
  value       = aws_db_instance.strapi_db.port
}


output "autoscaling_group_name" {
  description = "ECS Auto Scaling Group"
  value       = aws_autoscaling_group.ecs_asg.name
}
