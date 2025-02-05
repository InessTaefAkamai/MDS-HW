output "elasticache_cluster_id" {
  description = "ElastiCache cluster ID"
  value       = aws_elasticache_cluster.redis_cluster.id
}

output "elasticache_endpoint" {
  description = "Primary endpoint for connecting to the Redis cluster"
  value       = aws_elasticache_cluster.redis_cluster.cache_nodes[0].address
}

output "elasticache_port" {
  description = "ElastiCache Redis port"
  value       = aws_elasticache_cluster.redis_cluster.port
}
