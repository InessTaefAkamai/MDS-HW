# --------------------------------------
# VPC & Subnet Configuration
# --------------------------------------
variable "vpc_id" {
  description = "VPC ID where ElastiCache will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "List of private subnets for ElastiCache"
  type        = list(string)
}

# --------------------------------------
# Security Configuration
# --------------------------------------
variable "allowed_cidr_blocks" {
  description = "List of allowed CIDR blocks for Redis access"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

# --------------------------------------
# ElastiCache Configuration
# --------------------------------------
variable "elasticache_cluster_id" {
  description = "Unique ID for the ElastiCache cluster"
  type        = string
  default     = "cat-health-redis"
}

variable "elasticache_instance_type" {
  description = "Instance type for the ElastiCache cluster"
  type        = string
  default     = "cache.t3.micro"
}

variable "elasticache_node_count" {
  description = "Number of cache nodes in the cluster"
  type        = number
  default     = 1
}
