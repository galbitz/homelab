variable "hosts" {
  type = map(object({
    name              = string
    ip                = string
    mac               = string
    create_dns_record = optional(bool, true)
  }))
  default = {

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
    "docker-server" = {
      name = "docker-server"
      ip   = "192.168.1.17"
      mac  = ""
    }
    "docker-server-guacamole" = {
      name              = "docker-server-guacamole"
      ip                = "192.168.1.18"
      mac               = ""
      create_dns_record = false
    }
    "pikvm" = {
      name = "pikvm"
      ip   = "192.168.1.19"
      mac  = "DC:A6:32:28:0C:23"
    }
    "bee" = {
      name = "bee"
      ip   = "192.168.1.22"
      mac  = "7C:83:34:B9:2A:A0"
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

    "ha-screen" = {
      name = "ha-screen"
      ip   = "192.168.1.45"
      mac  = "d8:3a:dd:4d:14:7c"
    }

    "valheim-server" = {
      name = "valheim"
      ip   = "192.168.1.50"
      mac  = ""
    }
  }
}