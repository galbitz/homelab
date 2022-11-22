# Required permissions for dns: Zone:Zone:Edit, Zone:Zone Settings:Edit, Zone:DNS:Edit
# + Add Zone Resources include All zones
# Required permissions for tunnel: Account:Cloudflare Tunnel:Edit, Account:Access Appsand Policies:Edit, Zone:DNS:Edit
provider "cloudflare" {
  api_token = var.CLOUDFLARE_API_TOKEN
}

# Import zone: terraform import cloudflare_zone.home_zone 873e32bcbbb7ae294a37ea7668adaa12
resource "cloudflare_zone" "home_zone" {
  account_id = var.CLOUDFLARE_ACCOUNT_ID
  zone       = var.HOME_ZONE
}

resource "cloudflare_record" "home_dnsrecord" {
  zone_id = cloudflare_zone.home_zone.id
  name    = "home"
  value   = var.HOME_IP
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "host_records" {

  for_each = var.hosts

  zone_id = cloudflare_zone.home_zone.id
  name    = "${each.value.name}.home"
  value   = each.value.ip
  type    = "A"
  proxied = false
}

# Tunnel... once properly supported
# https://github.com/cloudflare/terraform-provider-cloudflare/issues/1756
