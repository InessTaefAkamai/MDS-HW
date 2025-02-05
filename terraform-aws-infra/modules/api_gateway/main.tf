resource "aws_api_gateway_rest_api" "api" {
  name        = var.api_name
  description = "API for Cat Health Monitoring System"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}
