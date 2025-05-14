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
      node = string
    }))
    workers = map(object({
      install_disk = string
      hostname     = optional(string)
      ip           = string
      node = string
    }))
  })
  default = {
    controlplanes = {
      "talos-control-01" = {
        install_disk = "/dev/sda"
        hostname = "talos-control-01"
        ip = "172.17.2.111/25"
        node         = "pve03"
      },
    }
    workers = {
      "talos-worker-01" = {
        install_disk = "/dev/sda"
        hostname     = "talos-worker-01"
        ip = "172.17.2.121/25"
        node         = "pve03"
      },
    }
  }
}

variable "default_gateway" {
  type    = string
  default = "172.17.2.1"
}
variable "tailscale_token" {
  type    = string
  sensitive = true
}
