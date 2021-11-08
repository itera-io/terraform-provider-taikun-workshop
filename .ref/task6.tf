data "taikun_flavors" "small" {
  cloud_credential_id = resource.taikun_cloud_credential_openstack.tfws_openstack.id
  min_cpu             = 2
  max_cpu             = 4
  max_ram = 8
}

locals {
  flavors = [for flavor in data.taikun_flavors.small.flavors : flavor.name]
}

resource "taikun_project" "tfws_project" {
  name = "tfws-project"

  flavors = local.flavors

  cloud_credential_id = resource.taikun_cloud_credential_openstack.tfws_openstack.id
  monitoring          = true

  kubernetes_profile_id = resource.taikun_kubernetes_profile.tfws_kubernetes_profile.id
  alerting_profile_id   = resource.taikun_alerting_profile.tfws_alerting_profile.id
  access_profile_id     = resource.taikun_access_profile.tfws_access_profile.id

  server_bastion {
    name = "b"
    flavor = local.flavors[0]
  }

  server_kubemaster {
    name = "m"
    flavor = local.flavors[0]
  }

  server_kubeworker {
    name = "w"
    flavor = local.flavors[0]
  }

  organization_id = resource.taikun_organization.tfws_organization.id
}
