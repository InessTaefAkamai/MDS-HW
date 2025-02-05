# --------------------------------------
# AWS Secrets Manager Secret
# --------------------------------------
resource "aws_secretsmanager_secret" "secrets" {
  name                    = var.secret_name
  description             = "Secrets for ${var.secret_name}"
  recovery_window_in_days = var.recovery_window_in_days
}

# --------------------------------------
# AWS Secrets Manager Secret Value
# --------------------------------------
resource "aws_secretsmanager_secret_version" "secret_version" {
  secret_id     = aws_secretsmanager_secret.secrets.id
  secret_string = jsonencode(var.secret_values)
}
