# --------------------------------------
# IAM Role for Lambda Function
# --------------------------------------
resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach necessary policies to the Lambda role
resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "lambda_s3_access" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

# --------------------------------------
# Lambda Function
# --------------------------------------
resource "aws_lambda_function" "cat_health_lambda" {
  function_name    = var.lambda_function_name
  runtime          = "python3.10"
  handler          = var.lambda_handler
  s3_bucket        = var.s3_bucket
  s3_key           = var.s3_key
  role             = aws_iam_role.lambda_role.arn
  timeout          = var.lambda_timeout
  memory_size      = var.lambda_memory

  environment {
    variables = {
      ENVIRONMENT = var.environment
    }
  }
}

# --------------------------------------
# Lambda Permission for API Gateway Invocation
# --------------------------------------
resource "aws_lambda_permission" "api_gateway_permission" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.cat_health_lambda.function_name
  principal     = "apigateway.amazonaws.com"
}
