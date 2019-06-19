resource "aws_iam_instance_profile" "common_role_profile" {
  name = "${lower(var.vpc_env)}-${lower(var.app_name)}-common-role-profile"
  path = "/"
  role = "${aws_iam_role.common_policy_role.name}"
}