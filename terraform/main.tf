# include hostrecords module
module "hostrecords" {
  source = "./hostrecords"
  hosts  = var.hosts

  CLOUDFLARE_ACCOUNT_ID    = var.CLOUDFLARE_ACCOUNT_ID
  CLOUDFLARE_API_TOKEN     = var.CLOUDFLARE_API_TOKEN
  CLOUDFLARE_ACCOUNT_EMAIL = var.CLOUDFLARE_ACCOUNT_EMAIL
  HOME_IP                  = var.HOME_IP
  HOME_ZONE                = var.HOME_ZONE
}

# module "vms" { source = "./vms"
#   hosts  = var.hosts
#   PM_PASS = var.PM_PASS
#   PM_USER = var.PM_USER
#   
# }
