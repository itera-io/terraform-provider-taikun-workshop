variable "users_t4" {
  type = map(object({
    email = string
    role  = string
  }))
  description = "User List"
  default     = {}
}

resource "taikun_user" "user" {
  for_each = var.users_t4

  user_name = each.key
  email     = each.value.email
  role      = each.value.role

  organization_id = resource.taikun_organization.tfws_organization.id
}
