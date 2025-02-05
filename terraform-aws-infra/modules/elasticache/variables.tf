### elasticache/variables.tf

variable "elasticache_cluster_id" {
  description = "ID for the Elasticache cluster"
  type        = string
}

variable "node_type" {
  description = "Instance type for the cache nodes"
  type        = string
  default     = "cache.t3.micro"
}

variable "num_cache_nodes" {
  description = "Number of cache nodes"
  type        = number
  default     = 1
}