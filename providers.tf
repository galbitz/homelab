terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}