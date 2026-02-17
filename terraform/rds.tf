resource "aws_db_subnet_group" "rds_subnet" {
  name       = "rds-subnet-group"
  subnet_ids = data.aws_subnets.default.ids
}

resource "aws_db_instance" "strapi_db" {
  identifier              = "strapi-db-t7"
  engine                  = "postgres"
  engine_version          = "15"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20

  db_name   = "strapi"
  username  = "strapi"
  password  = "StrongPassword123"

  multi_az            = false
  publicly_accessible = false
  skip_final_snapshot = true

  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet.name
}
