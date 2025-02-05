# --------------------------------------
# API Gateway REST API
# --------------------------------------
resource "aws_api_gateway_rest_api" "cat_api" {
  name        = var.api_gateway_name
  description = "API Gateway for Cat Health Monitoring System"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

# --------------------------------------
# API Gateway Resource (Base Path)
# --------------------------------------
resource "aws_api_gateway_resource" "cat_health" {
  rest_api_id = aws_api_gateway_rest_api.cat_api.id
  parent_id   = aws_api_gateway_rest_api.cat_api.root_resource_id
  path_part   = "cat-health"
}

# --------------------------------------
# API Gateway Method (POST Request to Lambda)
# --------------------------------------
resource "aws_api_gateway_method" "post_cat_data" {
  rest_api_id   = aws_api_gateway_rest_api.cat_api.id
  resource_id   = aws_api_gateway_resource.cat_health.id
  http_method   = "POST"
  authorization = "NONE"
}

# --------------------------------------
# API Gateway Integration with Lambda
# --------------------------------------
resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id = aws_api_gateway_rest_api.cat_api.id
  resource_id = aws_api_gateway_resource.cat_health.id
  http_method = aws_api_gateway_method.post_cat_data.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_invoke_arn
}

# --------------------------------------
# Deploy API Gateway
# --------------------------------------
resource "aws_api_gateway_deployment" "cat_api_deployment" {
  depends_on  = [aws_api_gateway_integration.lambda_integration]
  rest_api_id = aws_api_gateway_rest_api.cat_api.id
  stage_name  = "prod"
}

# --------------------------------------
# API Gateway Stage Logging
# --------------------------------------
resource "aws_api_gateway_stage" "prod_stage" {
  deployment_id = aws_api_gateway_deployment.cat_api_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.cat_api.id
  stage_name    = "prod"

  access_log_settings {
    destination_arn = var.cloudwatch_log_group_arn
    format          = "$context.requestId $context.identity.sourceIp $context.httpMethod $context.path"
  }
}
