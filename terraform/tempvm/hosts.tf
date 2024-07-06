variable "hosts" {
  type = map(object({
    name = string
    ip   = string
    mac  = string
  }))
  default = {
    "docker-test" = {
      name = "docker-test"
      ip   = "192.168.1.24"
      mac  = ""
    }
  }
}
