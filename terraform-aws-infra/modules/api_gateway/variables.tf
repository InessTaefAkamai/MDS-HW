variable "api_gateway_name" {
  description = "The name of the API Gateway"
  type        = string
  default     = "cat-health-api"
}

variable "lambda_invoke_arn" {
  description = "The ARN of the Lambda function for integration"
  type        = string
}

variable "cloudwatch_log_group_arn" {
  description = "ARN of the CloudWatch Log Group for API Gateway logging"
  type        = string
}
