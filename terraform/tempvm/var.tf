# Secrets from environment variables
variable "PM_USER" {}
variable "PM_PASS" {}

variable "proxmox_node" {
  default = {
    ip = "192.168.1.14" 
    name = "shadow"
  }
}

variable "ubuntu_template_name" {
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
