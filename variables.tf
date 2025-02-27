variable "cluster_name" {
  type    = string
  default = "talos-cluster"
}

variable "default_gateway" {
  type    = string
  default = "172.17.2.2"
}

variable "talos_cp_01_ip_addr" {
  type    = string
  default = "172.17.2.120"
}

variable "talos_worker_01_ip_addr" {
  type    = string
  default = "172.17.2.121"
}

variable "talos_worker_02_ip_addr" {
  type    = string
  default = "172.17.2.122"
}
