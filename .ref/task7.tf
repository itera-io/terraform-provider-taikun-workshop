resource "taikun_project_user_attachment" "tfws_attachment" {
  for_each = {
    for user in resource.taikun_user.tfws_user : user.id => user
    if user.role == "User"
  }

  user_id = each.value.id

  project_id = resource.taikun_project.tfws_project.id
}
