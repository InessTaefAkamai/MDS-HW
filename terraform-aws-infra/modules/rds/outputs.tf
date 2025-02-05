output "rds_instance_id" {
  description = "ID of the RDS instance"
  value       = aws_db_instance.rds_instance.id
}

output "rds_endpoint" {
  description = "Connection endpoint for the RDS database"
  value       = aws_db_instance.rds_instance.endpoint
}

output "rds_port" {
  description = "RDS database port"
  value       = aws_db_instance.rds_instance.port
}
