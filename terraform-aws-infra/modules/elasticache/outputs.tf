### elasticache/outputs.tf

output "elasticache_cluster_endpoint" {
  description = "Redis cluster endpoint"
  value       = aws_elasticache_cluster.redis.cache_nodes[0].address
}