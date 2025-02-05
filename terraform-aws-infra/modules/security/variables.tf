variable "vpc_id" {
  description = "The VPC ID where security groups will be created"
  type        = string
}

variable "allowed_ingress_cidr_blocks" {
  description = "List of CIDR blocks allowed for inbound traffic"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "db_port" {
  description = "The port number for the database (e.g., MySQL, PostgreSQL)"
  type        = number
  default     = 3306
}

variable "tags" {
  description = "Tags to apply to security resources"
  type        = map(string)
  default     = {
    Environment = "production"
    Project     = "Cat-Health-Monitoring"
  }
}
