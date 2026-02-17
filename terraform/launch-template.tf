data "aws_ami" "ecs_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-*-x86_64-ebs"]
  }
}

resource "aws_launch_template" "ecs_lt" {
  name_prefix   = "ecs-lt"
  image_id      = data.aws_ami.ecs_ami.id
  instance_type = "t2.micro"

   iam_instance_profile {
    name = "ec2-ecr-role"
  }



  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.ecs_sg.id]
  }

  user_data = base64encode(<<EOF
#!/bin/bash
echo ECS_CLUSTER=${aws_ecs_cluster.strapi_cluster.name} >> /etc/ecs/ecs.config
EOF
  )
}
