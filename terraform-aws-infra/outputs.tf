output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "rds_endpoint" {
  description = "RDS database endpoint"
  value       = module.rds.db_instance_endpoint
}

output "s3_bucket_name" {
  description = "S3 bucket for static content"
  value       = module.s3.bucket_name
}

output "cloudfront_distribution_domain_name" {
  description = "CloudFront distribution domain name"
  value       = module.cloudfront.cloudfront_distribution_domain_name
}

output "api_gateway_url" {
  description = "API Gateway URL"
  value       = module.api_gateway.invoke_url
}

output "load_balancer_dns" {
  description = "Load balancer DNS name"
  value       = module.load_balancer.alb_dns_name
}

output "route53_domain_name" {
  description = "Route 53 domain name"
  value       = module.route53.domain_name
}

output "secrets_manager_arn" {
  description = "ARN of the Secrets Manager secret"
  value       = module.secrets_manager.secret_arn
}

output "cloudwatch_log_group" {
  description = "CloudWatch log group"
  value       = module.cloudwatch.log_group_name
}
