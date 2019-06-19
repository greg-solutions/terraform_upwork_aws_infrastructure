
resource "aws_launch_configuration" "nodes" {
  name_prefix = "${var.app_name}-nodes-"
  image_id = "${data.aws_ami.centos7.id}"
  instance_type = "${var.worker_instance_type}"
  key_name = "${var.keypair_name}"
  iam_instance_profile = "${var.node_profile_name}"

  security_groups = [
    "${var.worker_security_group_ids}"
  ]

  associate_public_ip_address = "${var.public_worker}"

  user_data = "${data.template_cloudinit_config.node_cloud_init.rendered}"

  root_block_device {
    volume_type = "gp2"
    volume_size = "50"
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      "user_data"
    ]
  }
}

resource "aws_autoscaling_group" "nodes" {
  vpc_zone_identifier = [
    "${var.worker_subnet_ids}"]

  name = "${var.app_name}-nodes"
  max_size = "${var.max_worker_count}"
  min_size = "${var.min_worker_count}"
  desired_capacity = "${var.min_worker_count}"
  launch_configuration = "${aws_launch_configuration.nodes.name}"

  tags = [
    {
      key = "Name"
      value = "${var.app_name}-node"
      propagate_at_launch = true
    },
    {
      key = "kubernetes.io/cluster/${var.app_name}"
      value = "owned"
      propagate_at_launch = true
    }]

  lifecycle {
    ignore_changes = [
      "desired_capacity"]
  }
}

