module "nginx_server_develop" {
  source = "./nginx_server_modules"
  ami_id = "ami-0bb84b8ffd87024d8"
  instance_type = "t2.micro"
  server_name = "nginx-server-dev"
  enviroment = "develop"
}

module "nginx_server_qa" {
  source = "./nginx_server_modules"
  ami_id = "ami-0bb84b8ffd87024d8"
  instance_type = "t2.micro"
  server_name = "nginx-server-qa"
  enviroment = "qa"
}

######## Outout para obtener informacion de los recursos ##########
output "nginx_dev_ip" {
  description = "Ip Address public from instance EC2"
  value = module.nginx_server_develop.server_public_ip
}

output "nginx_dev_dns" {
  description = "Dns public from instance EC2"
  value = module.nginx_server_develop.server_public_dns
}

output "nginx_qa_ip" {
  description = "Ip Address public from instance EC2"
  value = module.nginx_server_qa.server_public_ip
}

output "nginx_qa_dns" {
  description = "Dns public from instance EC2"
  value = module.nginx_server_qa.server_public_dns
}