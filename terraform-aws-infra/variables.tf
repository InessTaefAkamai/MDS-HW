# AWS Region
variable "aws_region" {
  description = "The AWS region where resources are deployed"
  type        = string
}

# VPC Configuration
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
}

# EKS Cluster
variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "eks_cluster_version" {
  description = "Kubernetes version for EKS"
  type        = string
}

variable "eks_node_instance_type" {
  description = "Instance type for EKS worker nodes"
  type        = string
}

# RDS Database
variable "db_instance_class" {
  description = "Instance class for the RDS database"
  type        = string
}

variable "db_engine" {
  description = "Database engine type"
  type        = string
}

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

# S3 Configuration
variable "s3_bucket_name" {
  description = "Name of the S3 bucket for static content"
  type        = string
}

# CloudFront
variable "cloudfront_price_class" {
  description = "CloudFront price class (PriceClass_100, PriceClass_200, PriceClass_All)"
  type        = string
}

# API Gateway
variable "api_gateway_name" {
  description = "Name of the API Gateway"
  type        = string
}

# Load Balancer
variable "lb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

# Route 53
variable "domain_name" {
  description = "Domain name for Route 53"
  type        = string
}

# WAF (Web Application Firewall)
variable "waf_name" {
  description = "Name of the WAF ACL"
  type        = string
}

# Secrets Manager
variable "okta_org" {
  description = "Okta organization name"
  type        = string
}

variable "okta_api_token" {
  description = "Okta API token"
  type        = string
  sensitive   = true
}
