resource "consul_service" "counting" {
  name = "counting"
  node = consul_node.docker.name
  port = 9001
}

resource "consul_service" "dashboard" {
  name = "dashboard"
  node = consul_node.docker.name
  port = 9002
}
