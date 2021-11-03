terraform {
  required_providers {
    taikun = {
      source = "itera-io/dev/taikun"
    }
  }
}

provider "taikun" {
  email    = var.taikun_email
  password = var.taikun_password
}

# FIXME
