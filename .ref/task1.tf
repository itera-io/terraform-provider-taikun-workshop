resource "taikun_kubernetes_profile" "tfws_k8s_profile" {
  name = "tfws_k8s_profile"
  organization_id = resource.taikun_organization.tfws_organization.id
}
