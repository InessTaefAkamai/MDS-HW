resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = var.eks_role_arn
  version  = var.cluster_version

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = [var.eks_security_group_id]
  }

  tags = var.tags
}

# Node Group
resource "aws_eks_node_group" "eks_nodes" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "${var.cluster_name}-node-group"
  node_role_arn   = var.eks_role_arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    min_size     = var.node_group_min_size
    max_size     = var.node_group_max_size
    desired_size = var.node_group_desired_size
  }

  instance_types = [var.node_instance_type]

  remote_access {
    ec2_ssh_key = "eks-keypair"
  }

  tags = var.tags
}

# Security Group for EKS Nodes
resource "aws_security_group" "eks_nodes_sg" {
  vpc_id = var.vpc_id
  name   = "${var.cluster_name}-nodes-sg"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}
