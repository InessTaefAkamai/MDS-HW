### cloudfront/main.tf

resource "aws_cloudfront_distribution" "cdn" {
  origin {
    domain_name = var.alb_dns_name
    origin_id   = "ALB-Origin"
  }

  enabled             = true
  default_cache_behavior {
    target_origin_id       = "ALB-Origin"
    viewer_protocol_policy = "redirect-to-https"
  }
}