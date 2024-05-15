variable "ami_id" {
  description = "Id ami for instance"
  default     = "ami-0bb84b8ffd87024d8"
}

variable "instance_type" {
  description = "Type of instance"
  default     = "t2.micro"
}

variable "server_name" {
  description = "name server"
  default     = "webserver"
}
variable "enviroment" {
  description = "Enviroment Type"
  default     = "test"
}
