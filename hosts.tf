variable "hosts" {
  type = map(object({
    name = string
    ip   = string
  }))
  default = {
    "shadow" = {
      name = "shadow"
      ip   = "192.168.1.14"
    }
    "shadow2" = {
      name = "shadow2"
      ip   = "192.168.1.20"
    }
    "shadow3" = {
      name = "shadow3"
      ip   = "192.168.1.21"
    }
    "diskstation" = {
      name = "diskstation"
      ip   = "192.168.1.15"
    }
    "pve2" = {
      name = "pve2"
      ip   = "192.168.1.16"
    },
    "docker-server" = {
      name = "docker-server"
      ip   = "192.168.1.17"
    },
    "develop-server" = {
      name = "develop-server"
      ip   = "192.168.1.18"
    }
    "pikvm" = {
      name = "pikvm"
      ip   = "192.168.1.19"
    }
    "bee" = {
      name = "bee"
      ip   = "192.168.1.22"
    }

    "thin" = {
      name = "thin"
      ip   = "192.168.1.23"
    }

    "docker-server2" = {
      name = "docker-server2"
      ip   = "192.168.1.24"
    }

    "aio" = {
      name = "aio"
      ip   = "192.168.1.25"
    }

    "valheim-server" = {
      name = "valheim"
      ip   = "192.168.1.50"
    }
  }
}

# generate inventory file for Ansible
resource "local_file" "hosts" {
  content = templatefile("templates/ansible_inventory.tpl",
    {
      hosts = var.hosts
    }
  )
  filename = "playbooks/hosts"
}
