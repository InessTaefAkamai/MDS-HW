# --------------------------------------
# Load Balancer Configuration
# --------------------------------------
variable "lb_name" {
  description = "The name of the Application Load Balancer"
  type        = string
  default     = "cat-health-alb"
}

variable "vpc_id" {
  description = "VPC ID where the ALB will be deployed"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnets for ALB deployment"
  type        = list(string)
}

variable "acm_certificate_arn" {
  description = "ARN of the ACM SSL certificate for HTTPS"
  type        = string
}

# --------------------------------------
# Target Group Configuration
# --------------------------------------
variable "target_group_name" {
  description = "The name of the target group"
  type        = string
  default     = "alb-target-group"
}

variable "target_group_port" {
  description = "The port on which the target group listens"
  type        = number
  default     = 80
}
