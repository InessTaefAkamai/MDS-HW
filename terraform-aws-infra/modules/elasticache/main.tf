# --------------------------------------
# Security Group for ElastiCache
# --------------------------------------
resource "aws_security_group" "elasticache_sg" {
  name_prefix = "elasticache-sg-"
  description = "Security group for ElastiCache Redis"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# --------------------------------------
# ElastiCache Subnet Group
# --------------------------------------
resource "aws_elasticache_subnet_group" "elasticache_subnet_group" {
  name       = "elasticache-subnet-group"
  subnet_ids = var.subnet_ids
}

# --------------------------------------
# ElastiCache Redis Cluster
# --------------------------------------
resource "aws_elasticache_cluster" "redis_cluster" {
  cluster_id           = var.elasticache_cluster_id
  engine               = "redis"
  node_type            = var.elasticache_instance_type
  num_cache_nodes      = var.elasticache_node_count
  parameter_group_name = "default.redis7"
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.elasticache_subnet_group.name
  security_group_ids   = [aws_security_group.elasticache_sg.id]
}
