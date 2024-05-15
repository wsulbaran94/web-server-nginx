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
    Enviroment = var.enviroment
    Owner      = "wilfredosulbaran94@gmail.com"
    Team       = "DevOps"
    Project    = "webinar"
  }
}