variable "vpc_name" {
  description = "Name of VPC to make provisioning for. Almost all resources, created within VPC will be tagged with this value"
  type = "string"
}

variable "vpc_cidr" {
  default = ""
}

variable "env_name" {
  default = ""
}

variable "aws_availability_zones" {
  type = "list"
}
