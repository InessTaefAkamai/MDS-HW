### sqs/variables.tf

variable "sqs_queue_name" {
  description = "Name of the SQS queue"
  type        = string
}

variable "visibility_timeout" {
  description = "Visibility timeout for messages"
  type        = number
  default     = 30
}

variable "message_retention" {
  description = "Time messages are retained in seconds"
  type        = number
  default     = 345600
}