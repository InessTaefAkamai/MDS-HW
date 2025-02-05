output "alb_security_group_id" {
  description = "Security Group ID for ALB"
  value       = aws_security_group.alb_sg.id
}

output "rds_security_group_id" {
  description = "Security Group ID for RDS"
  value       = aws_security_group.rds_sg.id
}

output "elasticache_security_group_id" {
  description = "Security Group ID for ElastiCache"
  value       = aws_security_group.elasticache_sg.id
}

output "app_role_arn" {
  description = "IAM Role ARN for application services"
  value       = aws_iam_role.app_role.arn
}

output "waf_arn" {
  description = "ARN of the AWS WAF Web ACL"
  value       = aws_wafv2_web_acl.waf.arn
}
