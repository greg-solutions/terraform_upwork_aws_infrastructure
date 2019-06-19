variable "vpc_env" {
  description = "Name of VPC to make provisioning for. Almost all resources, created within VPC will be tagged with this value"
  type        = "string"
}

variable "app_name" {
  type = "string"
}

variable "vpc_cidr" {
  description = "CIDR of the VPC. Dont limit it to much. Prefer to use: \"Private IPv4 address spaces\""
  type        = "string"
}

variable "aws_availability_zones" {
  description = "Set of availability zones within region to spin up instances in. There is no need to specify more than 2 right now"
  type        = "list"
  default = ["us-east-1a","us-east-1b"]
}