provider "proxmox" {
  endpoint = "https://proxmox.local:8006/"
  insecure = true
  api_token = var.proxmox_token
}
