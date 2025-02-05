# --------------------------------------
# Domain Configuration
# --------------------------------------
variable "domain_name" {
  description = "The primary domain name"
  type        = string
}

# --------------------------------------
# ALB DNS Configuration
# --------------------------------------
variable "alb_dns_name" {
  description = "DNS name of the ALB"
  type        = string
}

variable "alb_zone_id" {
  description = "Zone ID of the ALB"
  type        = string
}

# --------------------------------------
# CloudFront DNS Configuration (Optional)
# --------------------------------------
variable "create_cloudfront_record" {
  description = "Flag to create a CloudFront CNAME record"
  type        = bool
  default     = false
}

variable "cloudfront_distribution_domain_name" {
  description = "CloudFront distribution domain name"
  type        = string
  default     = ""
}

# --------------------------------------
# MX Record Configuration (Optional)
# --------------------------------------
variable "create_mx_record" {
  description = "Flag to create an MX record for email services"
  type        = bool
  default     = false
}

variable "mx_records" {
  description = "List of MX records for the domain"
  type        = list(string)
  default     = ["10 mail.example.com"]
}

# --------------------------------------
# TXT Record Configuration (Optional)
# --------------------------------------
variable "create_txt_record" {
  description = "Flag to create a TXT record for domain verification"
  type        = bool
  default     = false
}

variable "txt_records" {
  description = "List of TXT records for the domain"
  type        = list(string)
  default     = ["v=spf1 include:_spf.example.com ~all"]
}
