variable "app_name" {
  type = "string"
}

variable "keypair_name" {
  default = ""
}

variable "node_profile_name" {
  default = ""
}

variable "kube_token" {
  default = ""
}

variable "worker_instance_type" {
  type = "string"
}

variable "worker_subnet_ids" {
  type = "list"
}

variable "worker_security_group_ids" {
  type = "list"
}

variable "max_worker_count" {
  type = "string"
}

variable "min_worker_count" {
  type = "string"
}

variable "public_worker" {
  type = "string"
}
