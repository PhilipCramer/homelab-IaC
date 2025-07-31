locals {
  talos = {
    version = "v1.10.6"
  }
}
data "talos_image_factory_extensions_versions" "this" {
  # get the latest talos version
  talos_version = local.talos.version
  filters = {
    names = [
      "iscsi-tools",
      "util-linux-tools",
      "qemu-guest-agent",
      "tailscale"
    ]
  }
}

resource "talos_image_factory_schematic" "this" {
  schematic = yamlencode(
    {
      customization = {
        systemExtensions = {
          officialExtensions = data.talos_image_factory_extensions_versions.this.extensions_info.*.name
        }
      }
    }
  )
}

resource "proxmox_virtual_environment_download_file" "talos_nocloud_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "pve03"

  file_name               = "talos-${local.talos.version}-${talos_image_factory_schematic.this.id}-nocloud-amd64.img"
  url                     = "https://factory.talos.dev/image/${talos_image_factory_schematic.this.id}/${local.talos.version}/nocloud-amd64.raw.gz"
  decompression_algorithm = "gz"
  overwrite               = false
}
