# --------------------------------------
# Lambda Function Configuration
# --------------------------------------
variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
  default     = "cat-health-lambda"
}

variable "lambda_handler" {
  description = "The handler function in the Lambda code"
  type        = string
  default     = "lambda_function.lambda_handler"
}

variable "lambda_timeout" {
  description = "Timeout for Lambda execution in seconds"
  type        = number
  default     = 10
}

variable "lambda_memory" {
  description = "Amount of memory allocated to Lambda"
  type        = number
  default     = 128
}

# --------------------------------------
# Environment Configuration
# --------------------------------------
variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
  default     = "prod"
}

# --------------------------------------
# Lambda Deployment via S3
# --------------------------------------
variable "s3_bucket" {
  description = "S3 bucket where the Lambda deployment package is stored"
  type        = string
}

variable "s3_key" {
  description = "S3 key (path) for the Lambda deployment package"
  type        = string
}
