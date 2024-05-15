terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

######## resource ##########
resource "aws_instance" "nginx_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.nginx_server_sg.id]
  subnet_id              = "subnet-0c36f31ca86cf3336"
  user_data              = <<-EOF
              #!/bin/bash
              sudo yum install -y nginx
              sudo systemctl enable nginx
              sudo systemctl start nginx
              EOF
  key_name               = aws_key_pair.nginx_server_ssh.key_name
  tags = {
    Name       = var.server_name
    Enviroment = var.enviroment
    Owner      = "wilfredosulbaran94@gmail.com"
    Team       = "DevOps"
    Project    = "webinar"
  }
}