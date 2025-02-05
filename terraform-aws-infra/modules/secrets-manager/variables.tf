# --------------------------------------
# Secrets Configuration
# --------------------------------------
variable "secret_name" {
  description = "Name of the secret in AWS Secrets Manager"
  type        = string
}

variable "secret_values" {
  description = "Key-value pairs to store in the secret"
  type        = map(string)
}

variable "recovery_window_in_days" {
  description = "The number of days before a deleted secret is permanently removed"
  type        = number
  default     = 7
}
