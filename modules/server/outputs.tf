output "droplet_ip_address" {
  value = digitalocean_droplet.mailserver.ipv4_address
}

output "droplet_id" {
  value = digitalocean_droplet.mailserver.id
}

output "droplet_name" {
  value = digitalocean_droplet.mailserver.name
}

output "droplet_urn" {
  value = digitalocean_droplet.mailserver.urn
}