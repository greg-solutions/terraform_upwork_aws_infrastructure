data "aws_ami" "centos7" {
  most_recent = true
  owners = ["aws-marketplace"]

  filter {
    name   = "product-code"
    values = ["aw0evgkw8e5c1q413zgy5pjce"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
#####
# Generate kubeadm token
#####

module "kubeadm-token" {
  source = "scholzj/kubeadm-token/random"
}


data "template_file" "init_node" {
  template = "${file("${path.module}/scripts/init-aws-kubernetes-node.sh")}"

  vars {
    kubeadm_token = "${module.kubeadm-token.token}"
    master_ip     = "${aws_eip.master.public_ip}"
    master_private_ip     = "${aws_instance.master.private_ip}"
    dns_name      = "${var.cluster_name}.${var.hosted_zone}"
  }
}
data "template_file" "cloud_init_config" {
  template = "${file("${path.module}/scripts/cloud-init-config.yaml")}"

  vars {
    calico_yaml = "${base64gzip("${file("${path.module}/scripts/calico.yaml")}")}"
  }
}


data "template_cloudinit_config" "node_cloud_init" {
  gzip          = true
  base64_encode = true

  part {
    filename     = "init-aws-kubernetes-node.sh"
    content_type = "text/x-shellscript"
    content      = "${data.template_file.init_node.rendered}"
  }
}