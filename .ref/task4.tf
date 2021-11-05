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

resource "taikun_cloud_credential_openstack" "tfws_openstack" {
  name = "tfws-openstack"

  user                = var.openstack_user
  password            = var.openstack_password
  url                 = var.openstack_url
  domain              = var.openstack_domain
  region              = var.openstack_region
  project_name        = var.openstack_project
  public_network_name = var.openstack_public_network

  organization_id = resource.taikun_organization.tfws_organization.id
}
