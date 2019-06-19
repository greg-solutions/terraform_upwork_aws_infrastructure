output "endpoint" {
  value = "${aws_eks_cluster.eks_cluster.endpoint}"
}

output "kubeconfig_certificate_authority_data" {
  value = "${aws_eks_cluster.eks_cluster.certificate_authority.0.data}"
}

output "eks_cluster_id" {
  value = "${aws_eks_cluster.eks_cluster.id}"
}

output "eks_cluster_arn" {
  value = "${aws_eks_cluster.eks_cluster.arn}"
}

output "eks_cluster_name" {
  value = "${aws_eks_cluster.eks_cluster.name}"
}