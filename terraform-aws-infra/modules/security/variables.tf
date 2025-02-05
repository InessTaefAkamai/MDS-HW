# --------------------------------------
# VPC & Subnet Configuration
# --------------------------------------
variable "vpc_id" {
  description = "VPC ID for security groups"
  type        = string
}

# --------------------------------------
# Security Group Dependencies
# --------------------------------------
variable "application_sg_id" {
  description = "Security Group ID for application services (EKS, EC2, Lambda)"
  type        = string
}

# --------------------------------------
# Database Configuration
# --------------------------------------
variable "db_port" {
  description = "Port for the database engine"
  type        = number
  default     = 5432
}

# --------------------------------------
# WAF Configuration
# --------------------------------------
variable "waf_blocklist_ip_set_arn" {
  description = "ARN of the IP set for blocking bad actors"
  type        = string
}

variable "alb_arn" {
  description = "ARN of the ALB to associate with WAF"
  type        = string
}
