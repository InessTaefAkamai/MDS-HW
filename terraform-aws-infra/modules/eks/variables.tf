variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.27"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where EKS will be deployed"
  type        = string
  default     = ""
}

variable "node_group_name" {
  description = "Name of the node group"
  type        = string
  default     = "eks-node-group"
}

variable "node_instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
  default     = "t3.medium"
}

variable "node_group_min_size" {
  description = "Minimum number of nodes in the EKS node group"
  type        = number
  default     = 2
}

variable "node_group_max_size" {
  description = "Maximum number of nodes in the EKS node group"
  type        = number
  default     = 5
}

variable "node_group_desired_size" {
  description = "Desired number of nodes in the EKS node group"
  type        = number
  default     = 3
}

variable "eks_security_group_id" {
  description = "Security Group ID for the EKS cluster"
  type        = string
}

variable "eks_role_arn" {
  description = "IAM Role ARN for the EKS cluster"
  type        = string
}

variable "enable_public_access" {
  description = "Allow public access to the EKS API"
  type        = bool
  default     = false
}

variable "key_name" {
  description = "SSH key name for EC2 instances"
  type        = string
  default     = "eks-keypair"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {
    Environment = "production"
    Project     = "Cat-Health-Monitoring"
  }
}
