output "assume_policy" {
  value = "${data.aws_iam_policy_document.ec2_assume_policy.json}"
}
output "common_profile_name" {
  value = "${aws_iam_instance_profile.common_role_profile.name}"
}
output "common_instance_role_id" {
  value = "${aws_iam_role.common_policy_role.id}"
}
output "common_instance_role_arn" {
  value = "${aws_iam_role.common_policy_role.arn}"
}