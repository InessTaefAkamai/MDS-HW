# --------------------------------------
# RDS Security Group
# --------------------------------------
resource "aws_security_group" "rds_sg" {
  name_prefix = "rds-sg-"
  description = "Security group for RDS"
  vpc_id      = var.vpc_id

  # Allow inbound PostgreSQL/MySQL access from internal networks
  ingress {
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  # Allow outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# --------------------------------------
# RDS Subnet Group
# --------------------------------------
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = var.subnet_ids
}

# --------------------------------------
# RDS Database Instance
# --------------------------------------
resource "aws_db_instance" "rds_instance" {
  identifier           = var.db_identifier
  engine              = var.db_engine
  engine_version      = var.db_engine_version
  instance_class      = var.db_instance_class
  allocated_storage   = var.db_allocated_storage
  storage_encrypted   = true
  username            = var.db_username
  password            = var.db_password
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  multi_az            = true
  publicly_accessible = false
  backup_retention_period = 7
  skip_final_snapshot     = false
  deletion_protection     = true
}
