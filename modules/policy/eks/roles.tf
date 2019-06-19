resource "aws_iam_role" "eks_policy_role" {
  name = "${lower(var.app_name)}-${lower(var.vpc_env)}-eks-role"

  assume_role_policy = "${data.aws_iam_policy_document.eks_assume_policy.json}"
}