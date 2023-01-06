resource "consul_node" "root" {
  name    = "root"
  address = "https://root.marceloboeira.com"
}

resource "consul_node" "docker" {
  name    = "docker"
  address = "127.0.0.1"
}
