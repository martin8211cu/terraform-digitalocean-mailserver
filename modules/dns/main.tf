# Add a record to the domain
resource "digitalocean_record" "mail" {
  domain = var.domain_name
  type   = "A"
  name   = "mail"
  ttl    = "30"
  value  = var.value
}

# Add mx record to the domain (so it can receive emails)
resource "digitalocean_record" "mx" {
  domain   = var.domain_name
  type     = "MX"
  name     = "@"
  priority = "10"
  ttl      = "14400"
  value    = "mail.${var.domain_name}."
}

# SPF
resource "digitalocean_record" "spf" {
  domain = var.domain_name
  type   = "TXT"
  name   = "@"
  ttl    = "14400"
  value  = "v=spf1 include:spf.mailjet.com mx ~all"
}

# DMARC
resource "digitalocean_record" "dmarc" {
  domain = var.domain_name
  type   = "TXT"
  name   = "_dmarc.${var.domain_name}"
  ttl    = "14400"
  value  = "v=DMARC1; p=none; rua=mailto:dmarc-reports@${var.domain_name}"
}

# SMTP
resource "digitalocean_record" "smtp" {
  domain = var.domain_name
  type   = "CNAME"
  name   = "smtp"
  ttl    = "14400"
  value  = "mail.${var.domain_name}."
}

# POP
resource "digitalocean_record" "pop" {
  domain = var.domain_name
  type   = "CNAME"
  name   = "pop"
  ttl    = "14400"
  value  = "mail.${var.domain_name}."
}

# IMAP
resource "digitalocean_record" "imap" {
  domain = var.domain_name
  type   = "CNAME"
  name   = "imap"
  ttl    = "14400"
  value  = "mail.${var.domain_name}."
}