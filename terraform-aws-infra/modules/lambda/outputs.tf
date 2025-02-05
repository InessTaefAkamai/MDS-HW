output "lambda_function_name" {
  description = "Name of the deployed Lambda function"
  value       = aws_lambda_function.cat_health_lambda.function_name
}

output "lambda_arn" {
  description = "ARN of the deployed Lambda function"
  value       = aws_lambda_function.cat_health_lambda.arn
}

output "lambda_invoke_arn" {
  description = "Invoke ARN for API Gateway integration"
  value       = aws_lambda_function.cat_health_lambda.invoke_arn
}
