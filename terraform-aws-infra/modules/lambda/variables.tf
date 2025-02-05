### lambda/variables.tf

variable "lambda_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "lambda_role_arn" {
  description = "IAM role ARN for Lambda"
  type        = string
}