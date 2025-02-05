### elasticache/main.tf

resource "aws_elasticache_cluster" "redis" {
  cluster_id           = var.elasticache_cluster_id
  engine              = "redis"
  node_type           = var.node_type
  num_cache_nodes     = var.num_cache_nodes
  parameter_group_name = "default.redis6.x"
}