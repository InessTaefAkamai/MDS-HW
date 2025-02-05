output "api_gateway_id" {
  description = "ID of the API Gateway"
  value       = aws_api_gateway_rest_api.cat_api.id
}

output "api_gateway_invoke_url" {
  description = "Base URL for the API Gateway"
  value       = aws_api_gateway_deployment.cat_api_deployment.invoke_url
}

output "api_gateway_stage_name" {
  description = "Name of the deployed API Gateway stage"
  value       = aws_api_gateway_stage.prod_stage.stage_name
}
