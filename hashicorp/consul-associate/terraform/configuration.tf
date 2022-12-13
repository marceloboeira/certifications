terraform {
  required_providers {
    consul = {
      source = "hashicorp/consul"
    }
  }
}

provider "consul" {
  address = "127.0.0.1:8500"
}
