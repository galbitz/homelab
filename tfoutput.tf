# Export Terraform variable values to an Ansible var_file
resource "local_file" "tf_ansible_vars_file_new" {
  content  = <<-DOC
    ---
    # Ansible vars_file containing variable values from Terraform.
    # Generated by Terraform mgmt configuration.

    cloudflare_api_token: "${var.CLOUDFLARE_API_TOKEN}"
    cloudflare_tunnel_token: "${var.CLOUDFLARE_TUNNEL_TOKEN}"
    cloudflare_account_id: "${var.CLOUDFLARE_ACCOUNT_ID}"
    cloudflare_zone_id: "${cloudflare_zone.home_zone.id}"
    cloudflare_home_record_id: "${cloudflare_record.home_dnsrecord.id}"
    cloudflare_email: "${var.CLOUDFLARE_ACCOUNT_EMAIL}"
    cloudflare_home_record_content: "${cloudflare_record.home_dnsrecord.name}.${cloudflare_zone.home_zone.zone}"
    cloudflare_ntfy_base_url: "https://ntfy.${cloudflare_zone.home_zone.zone}"

    diskstation_jellyfin_username: "${var.DISKSTATION_JELLYFIN_USERNAME}"
    diskstation_jellyfin_password: "${var.DISKSTATION_JELLYFIN_PASSWORD}"
    diskstation_jellyfin_ip: "${var.hosts["diskstation"].ip}"

    syslog_endpoint: "udp://${var.hosts["log-server"].ip}:514"
    DOC
  filename = "playbooks/group_vars/all/tf_ansible_vars_file.yml"
}