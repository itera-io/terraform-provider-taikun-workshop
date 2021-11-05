variable "users_t4" {
  type        = map(map(string))
  description = "User List"
  default = {
    "tfws-user1" = {
      email = "user1@fakedomain.fr"
      role  = "User"
    },
    "tfws-user2" = {
      email = "user2@fakedomain.fr"
      role  = "Manager"
    },
    "tfws-user3" = {
      email = "user3@fakedomain.fr"
      role  = "User"
    },
  }
}

resource "taikun_user" "user" {
  for_each = var.users_t4

  user_name = each.key
  email     = each.value.email
  role      = each.value.role
}
