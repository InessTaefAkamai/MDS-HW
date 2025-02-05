output "waf_acl_arn" {
  description = "ARN of the WAF Web ACL"
  value       = aws_wafv2_web_acl.waf_acl.arn
}

output "waf_acl_id" {
  description = "ID of the WAF Web ACL"
  value       = aws_wafv2_web_acl.waf_acl.id
}
