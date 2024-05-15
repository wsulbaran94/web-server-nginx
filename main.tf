terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}
######## vars ##########
variable "ami_id" {
  description = "Id ami for instance"
  default = "ami-0bb84b8ffd87024d8"
}

variable "instance_type" {
  description = "Type of instance"
  default = "t2.micro"
}

variable "server_name" {
  description = "name server"
  default = "webserver"
}
variable "enviroment" {
  description = "Enviroment Type"
  default = "test"
}
######## provider ##########
provider "aws" {
  region = "us-east-1"
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
######## resource ssh ##########

resource "aws_key_pair" "nginx_server_ssh" {
  key_name   = "nginx-server_ssh"
  public_key = file("nginx-server.key.pub")
  tags = {
    Name       = "${var.server_name} ssh"
    Enviroment = "${var.enviroment}"
    Owner      = "wilfredosulbaran94@gmail.com"
    Team       = "DevOps"
    Project    = "webinar"
  }
}

######## resource Security group ##########
resource "aws_security_group" "nginx_server_sg" {
  name        = "${var.server_name}_sg"
  description = "Security group allowing ssh and http access to ${var.server_name}"

  ingress {
    from_port   = 20
    to_port     = 20
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name       = "${var.server_name} server security group"
    Enviroment = "test"
    Owner      = "wilfredosulbaran94@gmail.com"
    Team       = "DevOps"
    Project    = "webinar"
  }
}

######## Outout para obtener informacion de los recursos ##########
output "server_public_ip" {
  description = "Ip Address public from instance EC2"
  value = aws_instance.nginx_server.public_ip
}

output "server_public_dns" {
  description = "Dns public from instance EC2"
  value = aws_instance.nginx_server.public_dns
}