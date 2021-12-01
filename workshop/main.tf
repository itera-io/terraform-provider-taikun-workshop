terraform {
  required_providers {
    taikun = {
      source  = "itera-io/taikun"
      version = "1.0.0"
    }
  }
}

provider "taikun" {
  email    = var.taikun_email
  password = var.taikun_password
}
