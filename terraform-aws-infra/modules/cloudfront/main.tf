# --------------------------------------
# CloudFront Distribution with ALB as Origin
# --------------------------------------
resource "aws_cloudfront_distribution" "cdn" {
  origin {
    domain_name = var.alb_dns_name
    origin_id   = "ALB-Origin"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "https-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  enabled             = true
  default_root_object = "index.html"
  price_class         = var.cloudfront_price_class

  # ----------------------------------
  # Default Cache Behavior (Forward Requests to ALB)
  # ----------------------------------
  default_cache_behavior {
    target_origin_id       = "ALB-Origin"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    cached_methods         = ["GET", "HEAD"]

    forwarded_values {
      query_string = true
      headers      = ["Authorization", "Host"]
      cookies {
        forward = "all"
      }
    }
  }

  # ----------------------------------
  # Custom Error Responses (Optional)
  # ----------------------------------
  custom_error_response {
    error_code            = 404
    response_page_path    = "/index.html"
    response_code         = 200
  }

  # ----------------------------------
  # Viewer Certificate (HTTPS with ACM)
  # ----------------------------------
  viewer_certificate {
    cloudfront_default_certificate = true
  }

  # ----------------------------------
  # Restrictions (Optional)
  # ----------------------------------
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  # ----------------------------------
  # Logging (Optional)
  # ----------------------------------
  logging_config {
    include_cookies = false
    bucket          = var.cloudfront_logging_bucket
    prefix          = "cloudfront-logs/"
  }
}
