# --------------------------------------
# WAF Configuration
# --------------------------------------
variable "waf_name" {
  description = "Name of the WAF Web ACL"
  type        = string
  default     = "cat-health-waf"
}

variable "alb_arn" {
  description = "ARN of the Application Load Balancer (ALB)"
  type        = string
}

# --------------------------------------
# IP Blocking Configuration
# --------------------------------------
variable "ip_set_arn" {
  description = "ARN of the IP Set used for blocking bad IPs"
  type        = string
}

# --------------------------------------
# Rate Limit Configuration
# --------------------------------------
variable "rate_limit" {
  description = "Rate limit for requests per 5-minute period per IP"
  type        = number
  default     = 2000
}
