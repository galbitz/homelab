# Secrets from environment variables
variable "PM_USER" {}
variable "PM_PASS" {}

variable "CLOUDFLARE_API_TOKEN" {}
variable "CLOUDFLARE_ACCOUNT_ID" {}
variable "CLOUDFLARE_ACCOUNT_EMAIL" {}
variable "CLOUDFLARE_HOME_TUNNEL_SECRET" {}

variable "HOME_IP" {}
variable "HOME_ZONE" {}

variable "DISKSTATION_JELLYFIN_USERNAME" {}
variable "DISKSTATION_JELLYFIN_PASSWORD" {}

variable "template_name" {
  default = "ubuntu-2004-cloudinit-template"
}

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
    "diskstation" = {
      name = "diskstation"
      ip   = "192.168.1.15"
    },
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
  }
}

variable "default_gateway" {
  default = "192.168.1.1"
}

data "http" "public_keys" {
  url = "https://github.com/galbitz.keys"
}
