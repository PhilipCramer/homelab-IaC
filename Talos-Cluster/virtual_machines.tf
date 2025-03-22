# Dynamic creation of control plane nodes based on variable.node_data.controlplanes
resource "proxmox_virtual_environment_vm" "control_plane" {
  for_each = var.node_data.controlplanes
  name        = each.value.hostname
  node_name = "pve03" # Node in Proxmox where VMs will be created

  memory {
    dedicated = 4096
  }
  cpu {
    cores   = 4
    type  = "x86-64-v2-AES"
  }
  network_device {
    bridge = "vmbr0"
    vlan_id = 20
  }
  disk {
    datastore_id = "local-lvm"
    file_id      = var.talos_image_id
    file_format  = "raw"
    interface    = "virtio0"
    size         = 20
  }
  operating_system {
    type = "l26" # Linux Kernel 2.6 - 5.X.
  }
  initialization {
    datastore_id = "local-lvm"
    ip_config {
      ipv4 {
        address = each.value.ip
        gateway = var.default_gateway
      }
    }
  }
}
resource "proxmox_virtual_environment_vm" "workers" {
  for_each = var.node_data.workers
  name        = each.value.hostname
  node_name = "pve03" # Node in Proxmox where VMs will be created

  memory {
    dedicated = 2048
  }
  cpu {
    cores   = 2
    type  = "x86-64-v2-AES"
  }
  network_device {
    bridge = "vmbr0"
    vlan_id = 20
  }
  disk {
    datastore_id = "local-lvm"
    file_id      = var.talos_image_id
    file_format  = "raw"
    interface    = "virtio0"
    size         = 20
  }
  operating_system {
    type = "l26" # Linux Kernel 2.6 - 5.X.
  }
  initialization {
    datastore_id = "local-lvm"
    ip_config {
      ipv4 {
        address = each.value.ip
        gateway = var.default_gateway
      }
    }
  }
}
