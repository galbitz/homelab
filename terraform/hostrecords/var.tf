variable "hosts" {
  description = "Map of host records"
  type        = map(any)
}

variable "CLOUDFLARE_API_TOKEN" {}
variable "CLOUDFLARE_ACCOUNT_ID" {}
variable "CLOUDFLARE_ACCOUNT_EMAIL" {}


variable "HOME_IP" {}
variable "HOME_ZONE" {}