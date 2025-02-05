# --------------------------------------
# VPC & Subnet Configuration
# --------------------------------------
variable "vpc_id" {
  description = "VPC ID where RDS will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "List of private subnets for RDS deployment"
  type        = list(string)
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed to connect to RDS"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

# --------------------------------------
# RDS Database Configuration
# --------------------------------------
variable "db_identifier" {
  description = "Unique identifier for the RDS instance"
  type        = string
  default     = "cat-health-db"
}

variable "db_engine" {
  description = "Database engine type (postgres or mysql)"
  type        = string
  default     = "postgres"
}

variable "db_engine_version" {
  description = "Version of the database engine"
  type        = string
  default     = "15.2"
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.medium"
}

variable "db_allocated_storage" {
  description = "Allocated storage for the database (GB)"
  type        = number
  default     = 20
}

variable "db_username" {
  description = "Master database username"
  type        = string
}

variable "db_password" {
  description = "Master database password"
  type        = string
  sensitive   = true
}

variable "db_port" {
  description = "Port for the database engine"
  type        = number
  default     = 5432
}
