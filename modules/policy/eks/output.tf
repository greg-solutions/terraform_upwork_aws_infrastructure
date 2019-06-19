output "eks_profile_name" {
  value = "${aws_iam_instance_profile.eks_role_profile.name}"
}

output "eks_instance_role_id" {
  value = "${aws_iam_role.eks_policy_role.id}"
}

output "eks_cluster_role_arn" {
  value = "${aws_iam_role.eks_policy_role.arn}"
}
