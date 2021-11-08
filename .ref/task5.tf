variable "task5_users" {
  type = map(object({
    email = string
    role  = string
    ssh_users = list(object({
      username = string
      public_key = string
    }))
  }))
  description = "Users List"
  default     = {}
}

resource "taikun_access_profile" "tfws_ap" {
  name = "tfws_access_profile"

  ntp_server {
    address = "time.windows.com"
  }

  dynamic "ssh_user" {
    for_each = flatten([for item in var.task5_users: item.ssh_users])
    content {
      name       = ssh_user.value.username
      public_key = ssh_user.value.public_key
    }
  }
  organization_id = resource.taikun_organization.tfws_organization.id
}
