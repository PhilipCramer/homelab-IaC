terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.73.0"
    }
    talos = {
      source  = "siderolabs/talos"
      version = "0.7.1"
    }
  }
}

provider "proxmox" {
  endpoint  = "https://172.17.2.12:8006/"
  insecure  = true
  api_token = var.proxmox_token

  ssh {
    agent    = false
    username = var.ssh_agent_username
    password = var.ssh_agent_password
    #private_key = file("./.ssh-key")
    node {
      name    = "pve03"
      address = "172.17.2.12"
    }
  }
}
