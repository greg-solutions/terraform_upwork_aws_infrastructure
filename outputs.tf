output "eks_endpoint" {
  value = "${module.eks_cluster.endpoint}"
}

output "eks_kubeconfig_certificate_authority_data" {
  value = "${module.eks_cluster.kubeconfig_certificate_authority_data}"
}