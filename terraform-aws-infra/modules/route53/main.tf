# --------------------------------------
# Route 53 Hosted Zone
# --------------------------------------
resource "aws_route53_zone" "primary" {
  name = var.domain_name
}

# --------------------------------------
# A Record for ALB
# --------------------------------------
resource "aws_route53_record" "alb_record" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}

# --------------------------------------
# CNAME for CloudFront (Optional)
# --------------------------------------
resource "aws_route53_record" "cloudfront_record" {
  count   = var.create_cloudfront_record ? 1 : 0
  zone_id = aws_route53_zone.primary.zone_id
  name    = "cdn.${var.domain_name}"
  type    = "CNAME"
  ttl     = 300
  records = [var.cloudfront_distribution_domain_name]
}

# --------------------------------------
# MX Record (Optional - Email Setup)
# --------------------------------------
resource "aws_route53_record" "mx_record" {
  count   = var.create_mx_record ? 1 : 0
  zone_id = aws_route53_zone.primary.zone_id
  name    = var.domain_name
  type    = "MX"
  ttl     = 3600
  records = var.mx_records
}

# --------------------------------------
# TXT Record (Optional - Domain Verification)
# --------------------------------------
resource "aws_route53_record" "txt_record" {
  count   = var.create_txt_record ? 1 : 0
  zone_id = aws_route53_zone.primary.zone_id
  name    = var.domain_name
  type    = "TXT"
  ttl     = 300
  records = var.txt_records
}
