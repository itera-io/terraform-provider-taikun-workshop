variable "task4_users" {
  type = map(object({
    email = string
    role  = string
  }))
  description = "Users List"
  default     = {}
}

resource "taikun_user" "user" {
  for_each = var.task4_users

  user_name = each.key
  email     = each.value.email
  role      = each.value.role

  organization_id = resource.taikun_organization.tfws_organization.id
}
