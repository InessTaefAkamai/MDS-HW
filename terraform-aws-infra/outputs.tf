output "eks_cluster_id" {
  value = module.eks.eks_cluster_id
}

output "eks_cluster_endpoint" {
  value = module.eks.eks_cluster_endpoint
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "security_group_id" {
  value = module.security.security_group_id
}

output "route53_zone_id" {
  value = module.route53.route53_zone_id
}

output "s3_bucket_name" {
  value = module.s3.s3_bucket_name
}

output "waf_acl_id" {
  value = module.waf.waf_acl_id
}

output "alb_dns_name" {
  value = module.load_balancer.alb_dns_name
}

output "api_gateway_url" {
  value = module.api_gateway.api_gateway_url
}
