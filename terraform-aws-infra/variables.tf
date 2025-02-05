variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
}

variable "db_name" {
  description = "Database name"
}

variable "bucket_name" {
  description = "S3 bucket for images"
}
