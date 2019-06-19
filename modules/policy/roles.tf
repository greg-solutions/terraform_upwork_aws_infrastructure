resource "aws_iam_role" "common_policy_role" {
  name = "${lower(var.app_name)}-${lower(var.vpc_env)}-common-role"

  assume_role_policy = "${data.aws_iam_policy_document.ec2_assume_policy.json}"
}