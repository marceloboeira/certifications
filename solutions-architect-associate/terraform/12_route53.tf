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
