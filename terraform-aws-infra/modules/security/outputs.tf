output "alb_security_group_id" {
  description = "Security Group ID for Application Load Balancer"
  value       = aws_security_group.alb_sg.id
}

output "eks_security_group_id" {
  description = "Security Group ID for EKS Cluster"
  value       = aws_security_group.eks_sg.id
}

output "eks_nodes_security_group_id" {
  description = "Security Group ID for EKS Worker Nodes"
  value       = aws_security_group.eks_nodes_sg.id
}

output "rds_security_group_id" {
  description = "Security Group ID for RDS Database"
  value       = aws_security_group.rds_sg.id
}
