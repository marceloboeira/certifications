# DNS & Route53 related

# Register the main/root domain
resource "aws_route53_zone" "main_domain" {
  name = var.main_domain
}

# Create a simple routing
resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.main_domain.zone_id
  name    = "www.${var.main_domain}"
  type    = "A"
  ttl     = "30"
  records = length(aws_instance.web_server.public_ip) > 0 ? [aws_instance.web_server.public_ip, aws_instance.web_server_replica.public_ip] : ["8.8.8.8"]
}

# Create a weighted routing
resource "aws_route53_record" "weighted_1" {
  zone_id = aws_route53_zone.main_domain.zone_id
  name    = "weighted.${var.main_domain}"
  type    = "A"
  ttl     = "30"

  weighted_routing_policy {
    weight = 30
  }
  set_identifier = "1"

  records = length(aws_instance.web_server_replica.public_ip) > 0 ? [aws_instance.web_server_replica.public_ip] : ["8.8.8.8"]
}

resource "aws_route53_record" "weighted_2" {
  zone_id = aws_route53_zone.main_domain.zone_id
  name    = "weighted.${var.main_domain}"
  type    = "A"
  ttl     = "30"

  weighted_routing_policy {
    weight = 70
  }

  set_identifier = "2"
  records        = length(aws_instance.web_server.public_ip) > 0 ? [aws_instance.web_server.public_ip] : ["8.8.8.8"]
}


# Create a latency based routing
resource "aws_route53_record" "latency_1" {
  zone_id = aws_route53_zone.main_domain.zone_id
  name    = "latency.${var.main_domain}"
  type    = "A"
  ttl     = "30"

  set_identifier = "1"
  latency_routing_policy {
    region = "eu-central-1"
  }

  records = length(aws_instance.web_server.public_ip) > 0 ? [aws_instance.web_server.public_ip] : ["8.8.8.8"]
}

resource "aws_route53_record" "latency_2" {
  zone_id = aws_route53_zone.main_domain.zone_id
  name    = "latency.${var.main_domain}"
  type    = "A"
  ttl     = "30"

  set_identifier = "2"
  latency_routing_policy {
    region = "eu-west-1"
  }

  records = length(aws_instance.web_server_replica.public_ip) > 0 ? [aws_instance.web_server_replica.public_ip] : ["8.8.8.8"]
}

# Create a failover based routing
resource "aws_route53_record" "failover_primary" {
  zone_id = aws_route53_zone.main_domain.zone_id
  name    = "failover.${var.main_domain}"
  type    = "A"
  ttl     = "30"

  set_identifier = "1"
  failover_routing_policy {
    type = "PRIMARY"
  }

  records = length(aws_instance.web_server.public_ip) > 0 ? [aws_instance.web_server.public_ip] : ["8.8.8.8"]

  health_check_id = aws_route53_health_check.failover_primary.id
}

resource "aws_route53_record" "failover_secondary" {
  zone_id = aws_route53_zone.main_domain.zone_id
  name    = "failover.${var.main_domain}"
  type    = "A"
  ttl     = "30"

  set_identifier = "2"
  failover_routing_policy {
    type = "SECONDARY"
  }

  records = length(aws_instance.web_server_replica.public_ip) > 0 ? [aws_instance.web_server_replica.public_ip] : ["8.8.8.8"]

  health_check_id = aws_route53_health_check.failover_secondary.id
}

resource "aws_route53_health_check" "failover_primary" {
  fqdn              = length(aws_instance.web_server.public_dns) > 0 ? aws_instance.web_server.public_dns : "marceloboeira.com"
  port              = 80
  type              = "HTTP"
  resource_path     = "/"
  failure_threshold = "2"
  request_interval  = "10"

  tags = {
    Name = "test"
  }
}

resource "aws_route53_health_check" "failover_secondary" {
  fqdn              = length(aws_instance.web_server_replica.public_dns) > 0 ? aws_instance.web_server_replica.public_dns : "marceloboeira.com"
  port              = 80
  type              = "HTTP"
  resource_path     = "/"
  failure_threshold = "2"
  request_interval  = "10"

  tags = {
    Name = "test"
  }
}

# Create a geolocation based routing
resource "aws_route53_record" "geolocation_1" {
  zone_id = aws_route53_zone.main_domain.zone_id
  name    = "geolocation.${var.main_domain}"
  type    = "A"
  ttl     = "30"

  set_identifier = "1"
  geolocation_routing_policy {
    country = "DE"
  }

  records = length(aws_instance.web_server.public_ip) > 0 ? [aws_instance.web_server.public_ip] : ["8.8.8.8"]
}

resource "aws_route53_record" "geolocation_2" {
  zone_id = aws_route53_zone.main_domain.zone_id
  name    = "geolocation.${var.main_domain}"
  type    = "A"
  ttl     = "30"

  set_identifier = "2"
  geolocation_routing_policy {
    country = "BR"
  }

  records = length(aws_instance.web_server_replica.public_ip) > 0 ? [aws_instance.web_server_replica.public_ip] : ["8.8.8.8"]
}
