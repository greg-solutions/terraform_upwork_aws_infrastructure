data "aws_availability_zones" "availability_zones" {}

data "aws_ami" "eks_worker" {
  filter {
    name = "name"
    values = [
      "amazon-eks-node-${var.cluster_version}-${var.worker_ami_name_filter}"]
  }

  most_recent = true

  # Owner ID of AWS EKS team
  owners = [
    "602401143452"]
}

locals {
  availability_zones = "${slice(data.aws_availability_zones.availability_zones.names,0,var.vpc_az_count)}"
}

output "selected_availability_zones" {
  value = "${local.availability_zones}"
}