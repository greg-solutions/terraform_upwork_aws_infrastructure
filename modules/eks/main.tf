module "aws_vpc" {
  source = "../vpc"
  app_name = "${var.vpc_name}"
  vpc_cidr = "${var.vpc_cidr}"
  vpc_env = "${var.env_name}"
  aws_availability_zones = "${slice(var.aws_availability_zones,0,length(var.aws_availability_zones))}"
}

module "aws_policy" {
  source = "../policy/eks"
  app_name = "${var.vpc_name}"
  vpc_env = "${var.env_name}"
}

resource "aws_eks_cluster" "eks_cluster" {
  name = "${lower(var.vpc_name)}-eks-cluster"
  role_arn = "${module.aws_policy.eks_cluster_role_arn}"

  vpc_config {
    subnet_ids = [
      "${module.aws_vpc.private-subnet-ids}"]
  }
}