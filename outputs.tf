output "server_ip_address" {
  value = module.ubuntu-server.droplet_ip_address
}

output "server_record" {
  value = module.server-record.record_fqdn
}