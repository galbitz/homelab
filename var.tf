# Secrets from environment variables
variable "PM_USER" {}
variable "PM_PASS" {}

variable "CLOUDFLARE_API_TOKEN" {}
variable "CLOUDFLARE_ACCOUNT_ID" {}
variable "CLOUDFLARE_TUNNEL_TOKEN" {}
variable "CLOUDFLARE_ACCOUNT_EMAIL" {}

variable "HOME_IP" {}
variable "HOME_ZONE" {}

variable "template_name" {
  default = "ubuntu-2004-cloudinit-template"
}

variable "hosts" {
  type = map(object({
    name = string
    ip   = string
  }))
  default = {
    "diskstation" = {
      name = "diskstation"
      ip   = "192.168.1.15"
    },
    "pve" = {
      name = "pve"
      ip   = "192.168.1.200"
    },
    "docker-server" = {
      name = "docker-server"
      ip   = "192.168.1.201"
    },
    "kasm-server" = {
      name = "kasm-server"
      ip   = "192.168.1.202"
    },
    "log-server" = {
      name = "log-server"
      ip   = "192.168.1.203"
    }
  }
}

variable "default_gateway" {
  default = "192.168.1.1"
}