variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "eks_cluster_role_arn" {
  description = "IAM role ARN for EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for EKS deployment"
  type        = list(string)
}


variable "node_desired_size" {
  description = "Desired number of nodes in the EKS cluster"
  type        = number
  default     = 2
}

variable "node_max_size" {
  description = "Maximum number of nodes in the EKS cluster"
  type        = number
  default     = 5
}

variable "node_min_size" {
  description = "Minimum number of nodes in the EKS cluster"
  type        = number
  default     = 1
}
