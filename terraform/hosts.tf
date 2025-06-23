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
    "king" = {
      name = "king"
      ip   = "192.168.1.9"
      mac  = "d0:11:e5:36:4a:22"
    }
    "game" = {
      name = "game"
      ip   = "192.168.1.10"
      mac  = "10:7c:61:74:6d:c8"
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
    "truenas" = {
      name = "truenas"
      ip   = "192.168.1.16"
      mac  = "BC:24:11:0D:FE:0F"
    }
    "docker-server" = {
      name = "docker-server"
      ip   = "192.168.1.17"
      mac  = ""
    }
    "docker-test" = {
      name              = "docker-test"
      ip                = "192.168.1.18"
      mac               = ""
      create_dns_record = false
    }
    "pikvm" = {
      name = "pikvm"
      ip   = "192.168.1.19"
      mac  = "DC:A6:32:28:0C:23"
    }
    "damage" = {
      name = "damage"
      ip   = "192.168.1.20"
      mac  = "60:cf:84:64:8a:34"
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
    "slzb" = {
      name = "slzb"
      ip   = "192.168.1.38"
      mac  = "78:1c:3c:a7:14:0f"
    }
    "bone" = {
      name = "bone"
      ip   = "192.168.1.39"
      mac  = "84:3a:5b:11:9c:46"
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
    "hue" = {
      name = "hue"
      ip   = "192.168.1.46"
      mac  = "ec:b5:fa:bc:1a:56"
    }
    "tplinksmartswitch" = {
      name = "tplinksmartswitch"
      ip   = "192.168.1.47"
      mac  = "dc:62:79:88:4f:68"
    }
  }
}