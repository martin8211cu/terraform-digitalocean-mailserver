resource "digitalocean_ssh_key" "key" {
  name       = var.ssh_key_name
  public_key = file("${var.ssh_key_file}")
}

resource "digitalocean_tag" "mailserver" {
  name = "mail"
}

resource "digitalocean_droplet" "mailserver" {
  name       = var.name
  image      = var.image
  region     = var.region
  size       = var.droplet_size
  ssh_keys   = [digitalocean_ssh_key.key.fingerprint]
  tags       = [digitalocean_tag.mailserver.id, var.tag]
  user_data  = file("${path.module}/files/userdata.yaml")
  monitoring = true
}

resource "digitalocean_volume" "mailserver" {
  region                  = var.region
  name                    = var.volume_name
  size                    = var.volume_size
  initial_filesystem_type = var.volume_filesystem_type
  description             = var.volume_description
  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_volume_attachment" "mailserver" {
  droplet_id = digitalocean_droplet.mailserver.id
  volume_id  = digitalocean_volume.mailserver.id
}
