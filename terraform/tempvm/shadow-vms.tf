provider "proxmox" {
  pm_api_url  = "https://${var.proxmox_node.ip}:8006/api2/json"
  pm_user     = var.PM_USER
  pm_password = var.PM_PASS
  pm_debug    = true
}

resource "proxmox_vm_qemu" "docker_test" {
  name        = var.hosts["docker-test"].name
  target_node = var.proxmox_node.name
  clone       = var.ubuntu_template_name

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
  vmid     = 920

  ciuser  = "sysadmin"
  sshkeys = <<EOF
    ${data.http.public_keys.response_body}
  EOF
  disks {
    ide {
        ide3 {
            cloudinit {
                storage = "local-big"
            }
          }
    }
    scsi {
      scsi0 {
        disk {
          size = "30"
          storage = "local-big"
          iothread = true
          discard = true
          emulatessd = true
          replicate = true
        }
      }
    }
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
  ipconfig0 = "ip=${var.hosts["docker-test"].ip}/24,gw=${var.default_gateway}"
}
