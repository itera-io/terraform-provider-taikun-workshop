resource "taikun_slack_configuration" "tfws_slack" {
  name    = "tfws_slack"
  channel = "ci"
  url     = "https://hooks.myapp.example/ci"
  type    = "Alert"

  organization_id = resource.taikun_organization.tfws_organization.id
}

resource "taikun_alerting_profile" "tfws_alerting_profile" {
  name     = "tfws_alerting_profile"
  reminder = "Daily"

  slack_configuration_id = resource.taikun_slack_configuration.tfws_slack.id
  organization_id        = resource.taikun_organization.tfws_organization.id
}
