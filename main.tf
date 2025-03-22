module "talos" {
  source           = "./Talos-Cluster"
  cluster_name     = "Homelab Talos"
  cluster_endpoint = ""
  talos_image_id   = proxmox_virtual_environment_download_file.talos_nocloud_image.id
}
