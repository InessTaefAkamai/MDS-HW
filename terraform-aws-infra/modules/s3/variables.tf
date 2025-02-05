# --------------------------------------
# S3 Bucket Configuration
# --------------------------------------
variable "s3_bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "force_destroy" {
  description = "Force destroy the bucket (dangerous in production)"
  type        = bool
  default     = false
}

variable "enable_versioning" {
  description = "Enable versioning on the S3 bucket"
  type        = bool
  default     = false
}

# --------------------------------------
# Logging Configuration
# --------------------------------------
variable "enable_logging" {
  description = "Enable logging for the S3 bucket"
  type        = bool
  default     = false
}

variable "logging_bucket" {
  description = "The S3 bucket where logs should be stored"
  type        = string
  default     = ""
}

# --------------------------------------
# Static Website Hosting
# --------------------------------------
variable "enable_website_hosting" {
  description = "Enable static website hosting"
  type        = bool
  default     = false
}

# --------------------------------------
# CloudFront Access Configuration
# --------------------------------------
variable "enable_cloudfront_access" {
  description = "Allow CloudFront to access this bucket"
  type        = bool
  default     = false
}

variable "cloudfront_distribution_arn" {
  description = "CloudFront distribution ARN for bucket policy"
  type        = string
  default     = ""
}
