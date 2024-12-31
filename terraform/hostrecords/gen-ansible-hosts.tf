
resource "local_file" "hosts" {
  content = templatefile("templates/ansible_inventory.tpl",
    {
      hosts = var.hosts
    }
  )
  filename = "../ansible/hosts"
}