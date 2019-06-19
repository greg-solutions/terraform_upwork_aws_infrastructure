
resource "aws_iam_role_policy_attachment" "eks_cluster_policy_attachment" {
  count      = "${var.manage_cluster_iam_resources ? 1 : 0}"
  role = "${aws_iam_role.eks_policy_role.id}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "eks_service_policy_attachment" {
  count      = "${var.manage_cluster_iam_resources ? 1 : 0}"
  role = "${aws_iam_role.eks_policy_role.id}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}
