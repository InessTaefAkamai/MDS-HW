output "cloudfront_distribution_id" {
  description = "ID of the CloudFront distribution"
  value       = aws_cloudfront_distribution.cdn.id
}

output "cloudfront_distribution_domain_name" {
  description = "CloudFront domain name for ALB backend"
  value       = aws_cloudfront_distribution.cdn.domain_name
}
