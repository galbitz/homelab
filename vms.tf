provider "proxmox" {
  pm_api_url  = "https://${var.hosts["shadow"].ip}:8006/api2/json"
  pm_user     = var.PM_USER
  pm_password = var.PM_PASS
  pm_debug    = true
}

resource "proxmox_vm_qemu" "docker_server" {
  name        = var.hosts["docker-server"].name
  target_node = var.hosts["shadow"].name
  clone       = var.template_name

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
    size     = "30G"
    type     = "scsi"
    storage  = "vmsdisk"
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
  ipconfig0 = "ip=${var.hosts["docker-server"].ip}/24,gw=${var.default_gateway}"
}

# resource "proxmox_vm_qemu" "develop_server" {
#   name        = "develop-server"
#   target_node = var.hosts["pve2"].name
#   clone       = var.template_name

#   agent    = 1
#   os_type  = "cloud-init"
#   qemu_os  = "l26"
#   cores    = 2
#   sockets  = 1
#   cpu      = "host"
#   memory   = 8192
#   scsihw   = "virtio-scsi-single"
#   bootdisk = "scsi0"

#   ciuser  = "root"
#   sshkeys = <<EOF
#     ${data.http.public_keys.response_body}
#   EOF

#   disk {
#     slot     = 0
#     size     = "30G"
#     type     = "scsi"
#     storage  = "local-lvm"
#     iothread = 1
#   }
#   lifecycle {
#     ignore_changes = [
#       network,
#     ]
#   }

#   ipconfig0 = "ip=${var.hosts["develop-server"].ip}/24,gw=${var.default_gateway}"
# }

# resource "null_resource" "run-ansible-develop-server" {
#   triggers = {
#     always_run = "${timestamp()}"
#   }

#   provisioner "local-exec" {
#     command = "cd playbooks && ./run.sh develop-server.yml"
#   }

#   depends_on = [proxmox_vm_qemu.develop_server]
# }


# generate inventory file for Ansible
resource "local_file" "hosts" {
  content = templatefile("templates/ansible_inventory.tpl",
    {
      hosts = var.hosts
    }
  )
  filename = "playbooks/hosts"
}
