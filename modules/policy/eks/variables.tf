variable "vpc_env" {
  description = "Name of VPC to make provisioning for. Almost all resources, created within VPC will be tagged with this value"
  type = "string"
}

variable "app_name" {
  type = "string"
}

variable "manage_cluster_iam_resources" {
  default = "1"
}