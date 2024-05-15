
######## Outout para obtener informacion de los recursos ##########
output "server_public_ip" {
  description = "Ip Address public from instance EC2"
  value = aws_instance.nginx_server.public_ip
}

output "server_public_dns" {
  description = "Dns public from instance EC2"
  value = aws_instance.nginx_server.public_dns
}