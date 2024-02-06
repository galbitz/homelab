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
  default = "ubuntu-2204-cloudinit-template"
}

variable "alpine_template_name" {
  default = "alpine-3.18.2-template"
}

variable "debian_template_name" {
  type    = string
  default = "debian-12-cloudinit-template"
}

variable "default_gateway" {
  default = "192.168.1.1"
}

data "http" "public_keys" {
  url = "https://github.com/galbitz.keys"
}
