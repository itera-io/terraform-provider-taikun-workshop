resource "taikun_project" "tfws_project" {
  name = "tfws-project"

  cloud_credential_id = resource.taikun_cloud_credential_openstack.tfws_openstack.id
  monitoring = true

  kubernetes_profile_id = resource.taikun_kubernetes_profile.tfws_kubernetes_profile.id
  alerting_profile_id = resource.taikun_alerting_profile.tfws_alerting_profile.id
  access_profile_id = resource.taikun_access_profile.tfws_access_profile.id

  organization_id = resource.taikun_organization.tfws_organization.id
}
