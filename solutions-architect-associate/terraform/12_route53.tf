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
  records = [aws_instance.web_server.public_ip, aws_instance.web_server_replica.public_ip]
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

  records = [aws_instance.web_server_replica.public_ip]
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
  records        = [aws_instance.web_server.public_ip]
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

  records = [aws_instance.web_server.public_ip]
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

  records = [aws_instance.web_server_replica.public_ip]
}
