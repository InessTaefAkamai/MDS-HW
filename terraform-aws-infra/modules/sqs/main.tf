### sqs/main.tf

resource "aws_sqs_queue" "message_queue" {
  name                      = var.sqs_queue_name
  visibility_timeout_seconds = var.visibility_timeout
  message_retention_seconds = var.message_retention
}