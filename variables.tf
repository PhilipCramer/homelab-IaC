variable "proxmox_token" {
  type      = string
  sensitive = true
}
variable "ssh_agent_username" {
  type      = string
  sensitive = true
}
variable "ssh_agent_password" {
  type      = string
  sensitive = true
}
variable "tailscale_token_talos" {
  type      = string
  sensitive = true
}
