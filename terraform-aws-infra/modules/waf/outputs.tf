### waf/outputs.tf

output "waf_acl_id" {
  description = "WAF ACL ID"
  value       = aws_wafv2_web_acl.waf_acl.id
}

output "waf_acl_arn" {
  description = "WAF ACL ARN"
  value       = aws_wafv2_web_acl.waf_acl.arn
}
