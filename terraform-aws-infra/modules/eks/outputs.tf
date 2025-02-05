output "eks_cluster_id" {
  description = "EKS Cluster ID"
  value       = aws_eks_cluster.eks_cluster.id
}

output "eks_cluster_endpoint" {
  description = "EKS Cluster API Endpoint"
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "eks_cluster_certificate_authority" {
  description = "EKS Cluster Certificate Authority Data"
  value       = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "eks_node_group_id" {
  description = "EKS Node Group ID"
  value       = aws_eks_node_group.eks_nodes.id
}

output "eks_node_role_arn" {
  description = "IAM Role ARN for EKS Nodes"
  value       = aws_iam_role.eks_node_role.arn
}
