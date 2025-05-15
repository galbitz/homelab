terraform {
  cloud {
    organization = "galbitz"

    workspaces {
      name = "homelab_tempvm"
    }
  }
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "3.0.1-rc9"
    }
  }
}
