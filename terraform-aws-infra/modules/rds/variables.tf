variable "db_identifier" {
  description = "The name of the RDS database"
  type        = string
}

variable "db_engine" {
  description = "The database engine to use (mysql, postgres, etc.)"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "The version of the database engine"
  type        = string
  default     = "8.0"
}

variable "db_instance_class" {
  description = "The instance class for the RDS database"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "The allocated storage size for the RDS database"
  type        = number
  default     = 20
}

variable "db_username" {
  description = "The master username for the database"
  type        = string
}

variable "db_password" {
  description = "The master password for the database"
  type        = string
  sensitive   = true
}

variable "db_port" {
  description = "The port for the database"
  type        = number
  default     = 3306
}

variable "multi_az" {
  description = "Enable multi-AZ for high availability"
  type        = bool
  default     = false
}

variable "publicly_accessible" {
  description = "Allow public access to the RDS instance (not recommended)"
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "Number of days to retain database backups"
  type        = number
  default     = 7
}

variable "db_security_group_id" {
  description = "Security group ID to attach to the RDS instance"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the RDS instance is deployed"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the RDS instance"
  type        = list(string)
}

variable "allowed_cidr_blocks" {
  description = "List of CIDR blocks allowed to access RDS"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "tags" {
  description = "Tags to apply to the RDS instance"
  type        = map(string)
  default     = {
    Environment = "production"
    Project     = "Cat-Health-Monitoring"
  }
}
