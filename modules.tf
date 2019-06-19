module "eks_cluster" {
  source = "github.com/greg-solutions/terraform-aws-vpc/eks"
  vpc_name = "${var.vpc_name}"
  vpc_cidr = "${var.vpc_cidr}"
  env_name = "${var.env_name}"
  aws_availability_zones = [
    "${slice(data.aws_availability_zones.availability_zones.names,0,var.vpc_az_count)}"]
}
module "ecr_api_repository" {
  source = "github.com/greg-solutions/terraform-aws-vpc/ecr"
  vpc_env = "${var.vpc_name}"
  image_tag = "api"
}
module "ecr_upwork_job_manager_repository" {
  source = "github.com/greg-solutions/terraform-aws-vpc/ecr"
  vpc_env = "${var.vpc_name}"
  image_tag = "job-manager"
}
module "ecr_telegram_manager_repository" {
  source = "github.com/greg-solutions/terraform-aws-vpc/ecr"
  vpc_env = "${var.vpc_name}"
  image_tag = "telegram-manager"
}


locals {
  kubeconfig = <<KUBECONFIG


apiVersion: v1
clusters:
- cluster:
    server: ${module.eks_cluster.endpoint}
    certificate-authority-data: ${module.eks_cluster.kubeconfig_certificate_authority_data}
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: aws
  name: aws
current-context: aws
kind: Config
preferences: {}
users:
- name: aws
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      command: heptio-authenticator-aws
      args:
        - "token"
        - "-i"
        - "${module.eks_cluster.eks_cluster_name}"
KUBECONFIG
}


output "kubeconfig" {
  value = "${local.kubeconfig}"
}

output "api_repository_url" {
  value = "${module.ecr_api_repository.application-repository-url}"
}

output "telegram_manager_repository_url" {
  value = "${module.ecr_telegram_manager_repository.application-repository-url}"
}

output "upwork_job_manager_repository_url" {
  value = "${module.ecr_upwork_job_manager_repository.application-repository-url}"
}