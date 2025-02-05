resource "aws_db_instance" "db" {
  identifier             = var.db_identifier
  allocated_storage      = var.db_allocated_storage
  engine                = var.db_engine
  engine_version        = var.db_engine_version
  instance_class        = var.db_instance_class
  username              = var.db_username
  password              = var.db_password
  db_subnet_group_name  = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [var.db_security_group_id]
  publicly_accessible   = var.publicly_accessible
  multi_az              = var.multi_az
  skip_final_snapshot   = true
  storage_encrypted     = true
  backup_retention_period = var.backup_retention_period
  tags = var.tags
}

# Define the RDS Subnet Group (grouping of subnets for high availability)
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.db_identifier}-subnet-group"
  subnet_ids = var.subnet_ids
  description = "Subnet group for RDS"

  tags = {
    Name = "${var.db_identifier}-subnet-group"
  }
}

# Security Group for RDS
resource "aws_security_group" "rds_sg" {
  vpc_id = var.vpc_id
  name   = "rds-security-group"

  ingress {
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}
