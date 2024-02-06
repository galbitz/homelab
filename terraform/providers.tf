terraform {
  cloud {
    organization = "galbitz"

    workspaces {
      name = "homelab"
    }
  }
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "3.0.1-rc1"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}
