# Create a Route 53 Hosted Zone
resource "aws_route53_zone" "primary" {
  name = var.domain_name
}

# Create an A record pointing to Load Balancer
resource "aws_route53_record" "alb" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}

# Create a CNAME record (for API Gateway)
resource "aws_route53_record" "api_gateway" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "api.${var.domain_name}"
  type    = "CNAME"
  ttl     = 300
  records = [var.api_gateway_url]
}

# Create MX record (for email configuration)
resource "aws_route53_record" "mx" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = var.domain_name
  type    = "MX"
  ttl     = 3600
  records = [
    "10 mail.example.com",
    "20 backup-mail.example.com"
  ]
}
