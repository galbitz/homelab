variable "hosts" {
  type = map(object({
    name = string
    ip   = string
    mac  = string
  }))
  default = {
    "unifiwifi" = {
      name = "unifiwifi"
      ip   = "192.168.1.2"
      mac  = "70:a7:41:73:7f:bb"
    }
    "switch" = {
      name = "switch"
      ip   = "192.168.1.3"
      mac  = "AC:15:A2:B9:2F:80"
    }
    "thin" = {
      name = "thin"
      ip   = "192.168.1.4"
      mac  = "c4:65:16:30:f6:4a"
    }
    "exit" = {
      name = "exit"
      ip   = "192.168.1.5"
      mac  = "a8:b8:e0:2:52:f7"
    }
    "battery" = {
      name = "battery"
      ip   = "192.168.1.11"
      mac  = "20:A5:CB:CD:B7:03"
    }
    "shadow" = {
      name = "shadow"
      ip   = "192.168.1.14"
      mac  = "04:7B:CB:48:C1:92"
    }
    "diskstation" = {
      name = "diskstation"
      ip   = "192.168.1.15"
      mac  = "00:11:32:B5:51:B1"
    }
    "game" = {
      name = "game"
      ip   = "192.168.1.16"
      mac  = "50:EB:F6:7F:EC:D1"
    }
    "docker-server" = {
      name = "docker-server"
      ip   = "192.168.1.17"
      mac  = ""
    }
    "docker-server-guacamole" = {
      name = "docker-server-guacamole"
      ip   = "192.168.1.18"
      mac  = ""
    }
    "pikvm" = {
      name = "pikvm"
      ip   = "192.168.1.19"
      mac  = "DC:A6:32:28:0C:23"
    }
    "shadow2" = {
      name = "shadow2"
      ip   = "192.168.1.20"
      mac  = "4:7B:CB:48:C0:44"
    }
    "shadow3" = {
      name = "shadow3"
      ip   = "192.168.1.21"
      mac  = ""
    }
    "bee" = {
      name = "bee"
      ip   = "192.168.1.22"
      mac  = "7C:83:34:B9:2A:A0"
    }
    "docker-test" = {
      name = "docker-test"
      ip   = "192.168.1.24"
      mac  = ""
    }
    "aio" = {
      name = "aio"
      ip   = "192.168.1.25"
      mac  = "C0:3C:59:A3:78:BB"
    }
    "githubrunner" = {
      name = "githubrunner"
      ip   = "192.168.1.26"
      mac  = ""
    }
    "ha" = {
      name = "ha"
      ip   = "192.168.1.40"
      mac  = "3a:39:e4:df:ef:7e"
    }
    "switchA" = {
      name = "switchA"
      ip   = "192.168.1.41"
      mac  = "A0:76:4E:32:73:7C"
    }
    "switchB" = {
      name = "switchB"
      ip   = "192.168.1.42"
      mac  = "60:55:F9:33:59:F8"
    }
    "switchC" = {
      name = "switchC"
      ip   = "192.168.1.43"
      mac  = "60:55:F9:33:D1:28"
    }
    "switchD" = {
      name = "switchD"
      ip   = "192.168.1.44"
      mac  = "60:55:F9:33:19:34"
    }
    "valheim-server" = {
      name = "valheim"
      ip   = "192.168.1.50"
      mac  = ""
    }
  }
}

# core docker network 192.168.1.60-61

# generate inventory file for Ansible
resource "local_file" "hosts" {
  content = templatefile("templates/ansible_inventory.tpl",
    {
      hosts = var.hosts
    }
  )
  filename = "../ansible/hosts"
}
