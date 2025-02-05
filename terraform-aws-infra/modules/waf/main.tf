### waf/main.tf

# Create a WAF Web ACL
resource "aws_wafv2_web_acl" "waf_acl" {
  name        = var.waf_name
  description = "Web ACL for protecting ALB and API Gateway"
  scope       = "REGIONAL"  # Use "REGIONAL" for ALB/API Gateway, "CLOUDFRONT" for CloudFront

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "WAFACLMetric"
    sampled_requests_enabled   = true
  }

  # Rule to block SQL Injection
  rule {
    name     = "SQLInjectionRule"
    priority = 1

    action {
      block {}
    }

    statement {
      sqli_match_statement {
        field_to_match {
          all_query_arguments = {}
        }
        text_transformation {
          priority = 1
          type     = "URL_DECODE"
        }
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "SQLInjectionMetric"
      sampled_requests_enabled   = true
    }
  }
}

# Associate WAF with ALB
resource "aws_wafv2_web_acl_association" "waf_alb_association" {
  resource_arn = var.alb_arn
  web_acl_arn  = aws_wafv2_web_acl.waf_acl.arn
}

# Associate WAF with API Gateway
resource "aws_wafv2_web_acl_association" "waf_apigw_association" {
  resource_arn = var.api_gateway_arn
  web_acl_arn  = aws_wafv2_web_acl.waf_acl.arn
}
