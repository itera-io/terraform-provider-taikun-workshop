# Variables for Taikun authentication
variable "taikun_email" {
  description = "Taikun email"
  type        = string
  sensitive   = true
}

variable "taikun_password" {
  description = "Taikun password"
  type        = string
  sensitive   = true
}

variable "openstack_url" {
  description = "OpenStack url"
  type        = string
  sensitive   = true
}
variable "openstack_user" {
  description = "OpenStack user"
  type        = string
  sensitive   = true
}
variable "openstack_password" {
  description = "OpenStack password"
  type        = string
  sensitive   = true
}
variable "openstack_domain" {
  description = "OpenStack domain"
  type        = string
  sensitive   = true
}
variable "openstack_region" {
  description = "OpenStack region"
  type        = string
}
variable "openstack_public_network" {
  description = "OpenStack public network"
  type        = string
}
variable "openstack_project" {
  description = "OpenStack project name"
  type        = string
}
