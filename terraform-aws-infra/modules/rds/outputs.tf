output "rds_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = aws_db_instance.db.endpoint
}

output "rds_instance_id" {
  description = "The RDS instance ID"
  value       = aws_db_instance.db.id
}

output "rds_port" {
  description = "The database port"
  value       = aws_db_instance.db.port
}

output "rds_security_group_id" {
  description = "The security group ID attached to the RDS instance"
  value       = aws_security_group.rds_sg.id
}

output "rds_subnet_group_name" {
  description = "The subnet group name for the RDS instance"
  value       = aws_db_subnet_group.db_subnet_group.name
}
