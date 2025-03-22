variable "cluster_name" {
  description = "A name to provide for the Talos cluster"
  type        = string
}

variable "cluster_endpoint" {
  description = "The endpoint for the Talos cluster"
  type        = string
}

variable "node_data" {
  description = "A map of node data"
  type = object({
    controlplanes = map(object({
      install_disk = string
      hostname     = optional(string)
      ip           = string
    }))
    workers = map(object({
      install_disk = string
      hostname     = optional(string)
      ip           = string
    }))
  })
  default = {
    controlplanes = {
      "control-1" = {
        install_disk = "/dev/sda"
        hostname = "talos-control-01"
        ip = "172.17.2.111/25"
      },
      "control-2" = {
        install_disk = "/dev/sda"
        hostname = "talos-control-02"
        ip = "172.17.2.112/25"
      }
    }
    workers = {
      "worker-1" = {
        install_disk = "/dev/sda"
        hostname     = "talos-worker-1"
        ip = "172.17.2.121/25"
      }
    }
  }
}

variable "default_gateway" {
  type    = string
  default = "172.17.2.2"
}
variable "talos_image_id" {
}
