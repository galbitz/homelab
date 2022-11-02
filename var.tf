
variable "proxmox_host" {
    default = "pve"
}

variable "template_name" {
    default = "ubuntu-2004-cloudinit-template"
}

variable "vault_id" {
    default = "infra"
}

variable "PM_USER" {}
variable "PM_PASS" {}