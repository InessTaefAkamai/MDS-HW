### lambda/main.tf

resource "aws_lambda_function" "backend_lambda" {
  function_name    = var.lambda_name
  runtime         = "python3.8"
  handler         = "lambda_function.lambda_handler"
  role            = var.lambda_role_arn
  filename        = "lambda.zip"
}