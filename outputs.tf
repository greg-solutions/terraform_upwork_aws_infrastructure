output "eks_endpoint" {
  value = "${module.eks_cluster.endpoint}"
}

output "eks_kubeconfig_certificate_authority_data" {
  value = "${module.eks_cluster.kubeconfig_certificate_authority_data}"
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