provider "proxmox" {
  endpoint  = "https://172.17.1.12:8006/"
  insecure  = true
  api_token = var.proxmox_token

  ssh {
    agent    = true
    username = var.ssh_agent_username
    password = var.ssh_agent_password
    #private_key = file("./.ssh-key")
  }
}
