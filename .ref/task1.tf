resource "taikun_kubernetes_profile" "tfws_kubernetes_profile" {
  name            = "tfws_kubernetes_profile"
  organization_id = resource.taikun_organization.tfws_organization.id
}
