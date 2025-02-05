output "route53_zone_id" {
  description = "The ID of the Route 53 Hosted Zone"
  value       = aws_route53_zone.primary.zone_id
}

output "route53_domain_name" {
  description = "The registered domain name"
  value       = aws_route53_zone.primary.name
}

output "alb_dns_record" {
  description = "The DNS record for the Application Load Balancer"
  value       = aws_route53_record.alb.fqdn
}

output "api_gateway_dns_record" {
  description = "The DNS record for API Gateway"
  value       = aws_route53_record.api_gateway.fqdn
}
