terraform {
  cloud {
    organization = "galbitz"

    workspaces {
      name = "homelab"
    }
  }
}
