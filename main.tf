module "ubuntu-server" {
  source = "./modules/server"

  name                   = var.name
  image                  = var.image
  environment            = var.environment
  tag                    = var.tag
  domain_name            = var.domain_name
  droplet_size           = var.droplet_size
  region                 = var.region
  ssh_key_name           = var.ssh_key_name
  ssh_key_file           = var.ssh_key_file
  volume_name            = var.volume_name
  volume_size            = var.volume_size
  volume_filesystem_type = var.volume_filesystem_type
  volume_description     = var.volume_description
}

module "server-record" {
  source = "./modules/dns"

  domain_name = var.domain_name
  value       = module.ubuntu-server.droplet_ip_address
}