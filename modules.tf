module "eks_cluster" {
  source = "github.com/greg-solutions/terraform-aws-vpc/eks"
  vpc_name = "${var.vpc_name}"
  vpc_cidr = "${var.vpc_cidr}"
  env_name = "${var.env_name}"
  aws_availability_zones = ["${slice(data.aws_availability_zones.availability_zones.names,0,var.vpc_az_count)}"]
}
module "ecr_repository" {
  source = "github.com/greg-solutions/terraform-aws-vpc/ecr"
  vpc_env = "${var.vpc_name}"
  image_tag="api"
}