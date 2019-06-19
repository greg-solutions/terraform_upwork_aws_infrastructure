resource "aws_iam_instance_profile" "eks_role_profile" {
  name = "${lower(var.vpc_env)}-${lower(var.app_name)}-eks-role-profile"
  path = "/"
  role = "${aws_iam_role.eks_policy_role.name}"
}
