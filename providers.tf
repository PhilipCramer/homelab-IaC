terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.80.0"
    }
    talos = {
      source  = "siderolabs/talos"
      version = "0.8"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "3.0.2"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.3"
    }
  }
}

provider "proxmox" {
  endpoint  = "https://172.17.1.12:8006/"
  insecure  = true
  api_token = var.proxmox_token

  ssh {
    agent    = false
    username = var.ssh_agent_username
    password = var.ssh_agent_password
    #private_key = file("./.ssh-key")
    node {
      name    = "pve03"
      address = "172.17.1.12"
    }
  }
}
provider "helm" {
  kubernetes = {
    host               = module.talos.cluster_endpoint
    client_certificate = base64decode(module.talos.kubeconfig.client_certificate)
    client_key         = base64decode(module.talos.kubeconfig.client_key)
    insecure           = true
  }
}
