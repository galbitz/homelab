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
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}
