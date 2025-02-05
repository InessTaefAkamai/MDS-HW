output "eks_cluster_id" {
  description = "EKS Cluster ID"
  value       = aws_eks_cluster.eks.id
}

output "eks_cluster_endpoint" {
  description = "Endpoint for Kubernetes API"
  value       = aws_eks_cluster.eks.endpoint
}

output "eks_cluster_certificate" {
  description = "Base64 encoded cluster CA certificate"
  value       = aws_eks_cluster.eks.certificate_authority[0].data
  sensitive   = true
}

output "eks_cluster_security_group_id" {
  description = "Security Group ID for EKS Cluster"
  value       = aws_eks_cluster.eks.vpc_config[0].security_group_ids
}

output "eks_nodes_security_group_id" {
  description = "Security Group ID for EKS Worker Nodes"
  value       = aws_security_group.eks_nodes_sg.id
}

output "eks_node_group_arn" {
  description = "ARN of the EKS Node Group"
  value       = aws_eks_node_group.eks_nodes.arn
}

