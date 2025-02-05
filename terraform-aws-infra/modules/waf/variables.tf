### waf/variables.tf

variable "waf_name" {
  description = "Name of the WAF ACL"
  type        = string
  default     = "waf-acl"
}

variable "alb_arn" {
  description = "ARN of the Application Load Balancer to attach WAF"
  type        = string
}

variable "api_gateway_arn" {
  description = "ARN of the API Gateway to attach WAF"
  type        = string
}


