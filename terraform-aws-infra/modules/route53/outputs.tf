output "route53_zone_id" {
  description = "Route 53 Hosted Zone ID"
  value       = aws_route53_zone.primary.zone_id
}

output "alb_record_fqdn" {
  description = "Fully qualified domain name (FQDN) for the ALB"
  value       = aws_route53_record.alb_record.fqdn
}

output "cloudfront_cdn_fqdn" {
  description = "Fully qualified domain name (FQDN) for the CloudFront CDN"
  value       = var.create_cloudfront_record ? aws_route53_record.cloudfront_record[0].fqdn : null
}
