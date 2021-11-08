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
