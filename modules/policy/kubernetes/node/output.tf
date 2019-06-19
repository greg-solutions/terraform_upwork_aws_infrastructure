output "node_profile_id" {
  value = "${aws_iam_instance_profile.node_profile.id}"
}
output "node_profile_name" {
  value = "${aws_iam_instance_profile.node_profile.name}"
}
output "node_role_name" {
  value = "${aws_iam_role.node_role.name}"
}
output "node_role_id" {
  value = "${aws_iam_role.node_role.id}"
}