variable "vpc_name" {
  description = "Name of VPC to make provisioning for. Almost all resources, created within VPC will be tagged with this value"
  type        = "string"
}
variable "vpc_cidr" {
}
variable "env_name" {

}
variable "vpc_az_count" {
  default = "2"
}

variable "cluster_version" {
  description = "Kubernetes version to use for the EKS cluster."
  default     = "1.12"
}

variable "worker_ami_name_filter" {
  description = "Additional name filter for AWS EKS worker AMI. Default behaviour will get latest for the cluster_version but could be set to a release from amazon-eks-ami, e.g. \"v20190220\""
  default     = "v*"
}