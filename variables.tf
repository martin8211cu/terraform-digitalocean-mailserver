variable "domain_name" {}
variable "droplet_size" {
  type    = string
  default = "s-1vcpu-1gb"
}
variable "environment" {
  type    = string
  default = "Development"
}
variable "image" {
  type    = string
  default = "debian-10-x64"
}
variable "name" {}
variable "project_name" {
  type    = string
  default = "Project Terraform"
}
variable "region" {
  type    = string
  default = "sfo3"
}
variable "ssh_key_file" {}
variable "ssh_key_name" {}
variable "tag" {
  type    = string
  default = "server"
}
variable "volume_name" {
  type    = string
  default = "mail"
}
variable "volume_size" {
  type    = string
  default = 5
}
variable "volume_filesystem_type" {
  type    = string
  default = "ext4"
}
variable "volume_description" {
  type    = string
  default = "Email server disk"
}