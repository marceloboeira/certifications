resource "consul_node" "root" {
  name    = "root"
  address = "https://root.marceloboeira.com"
}

resource "consul_node" "google" {
  name    = "google"
  address = "https://marceloboeira.com"
}
