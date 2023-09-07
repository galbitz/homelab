provider "proxmox" {
  pm_api_url  = "https://${var.hosts["bee"].ip}:8006/api2/json"
  pm_user     = var.PM_USER
  pm_password = var.PM_PASS
  pm_debug    = true
  alias       = "bee"
}

resource "proxmox_vm_qemu" "docker_server2" {
  provider    = proxmox.bee
  vmid        = 100
  name        = var.hosts["docker-server2"].name
  target_node = var.hosts["bee"].name
  clone       = var.debian_template_name

  # basic VM settings here. agent refers to guest agent
  agent    = 1
  os_type  = "cloud-init"
  qemu_os  = "l26"
  cores    = 4
  sockets  = 1
  cpu      = "host"
  memory   = 8192
  scsihw   = "virtio-scsi-single"
  bootdisk = "scsi0"
  onboot   = true

  ciuser  = "root"
  sshkeys = <<EOF
    ${data.http.public_keys.response_body}
  EOF

  disk {
    slot     = 0
    size     = "20G"
    type     = "scsi"
    storage  = "local-lvm"
    iothread = 1
  }

  #   # if you want two NICs, just copy this whole network section and duplicate it
  #   network {
  #     model = "virtio"
  #     bridge = "vmbr0"
  #   }

  # not sure exactly what this is for. presumably something about MAC addresses and ignore network changes during the life of the VM
  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  #ipconfig0 = "ip=dhcp"
  ipconfig0 = "ip=${var.hosts["docker-server2"].ip}/24,gw=${var.default_gateway}"
}
