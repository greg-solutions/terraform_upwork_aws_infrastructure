data "template_file" "node_policy_json" {
  template = "${file("${path.module}/templates/node-policy.json.tpl")}"

  vars {}
}
data "template_file" "node_assume_policy_json" {
  template = "${file("${path.module}/templates/node-assume-policy.json.tpl")}"
  vars {}
}

resource "aws_iam_policy" "node_policy" {
  name = "${var.app_name}-node"
  path = "/"
  description = "Policy for role ${var.app_name}-node"
  policy = "${data.template_file.node_policy_json.rendered}"
}

resource "aws_iam_policy_attachment" "node-attach" {
  name = "node-attachment"
  roles = [
    "${aws_iam_role.node_role.name}"]
  policy_arn = "${aws_iam_policy.node_policy.arn}"
}

resource "aws_iam_role" "node_role" {
  name = "${var.app_name}-node"

  assume_role_policy = "${data.template_file.node_assume_policy_json.rendered}"
}


resource "aws_iam_instance_profile" "node_profile" {
  name = "${var.app_name}-node"
  role = "${aws_iam_role.node_role.name}"
}
