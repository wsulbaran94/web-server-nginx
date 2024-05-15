######## resource ssh ##########

resource "aws_key_pair" "nginx_server_ssh" {
  key_name   = "nginx-server_ssh_${var.enviroment}"
  public_key = file("nginx-server-${var.enviroment}.key.pub")
  tags = {
    Name       = "${var.server_name} ssh"
    Enviroment = "${var.enviroment}"
    Owner      = "wilfredosulbaran94@gmail.com"
    Team       = "DevOps"
    Project    = "webinar"
  }
}
