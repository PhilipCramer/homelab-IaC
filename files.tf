locals {
  talos = {
    version = "v1.9.4"
  }
}

resource "proxmox_virtual_environment_download_file" "talos_nocloud_image" {
  content_type            = "iso"
  datastore_id            = "local"
  node_name               = "pve03"

  file_name               = "talos-${local.talos.version}-nocloud-amd64.img"
  url                     = "https://factory.talos.dev/image/0d4ffb8ade43a79a8960e60a41c6fac75df764f253d572c0204535c1c6d2b828/${local.talos.version}/nocloud-amd64.raw.gz"
  decompression_algorithm = "gz"
  overwrite               = false
}
