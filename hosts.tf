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
  }
}
