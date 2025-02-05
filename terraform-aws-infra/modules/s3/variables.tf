# 🔹 Security Group for ALB (Application Load Balancer)
resource "aws_security_group" "alb_sg" {
  name   = "alb-security-group"
  vpc_id = var.vpc_id

  # Allow HTTP Traffic (Port 80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_ingress_cidr_blocks
  }

  # Allow HTTPS Traffic (Port 443)
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.allowed_ingress_cidr_blocks
  }

  # Allow all outgoing traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

# 🔹 Security Group for EKS Cluster
resource "aws_security_group" "eks_sg" {
  name   = "eks-security-group"
  vpc_id = var.vpc_id

  # Allow inbound communication from worker nodes
  ingress {
    from_port       = 0
    to_port         = 65535
    protocol        = "tcp"
    security_groups = [aws_security_group.eks_nodes_sg.id] # Allow traffic from EKS nodes
  }

  # Allow all outgoing traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

# 🔹 Security Group for EKS Worker Nodes
resource "aws_security_group" "eks_nodes_sg" {
  name   = "eks-nodes-security-group"
  vpc_id = var.vpc_id

  # Allow inbound communication from EKS control plane
  ingress {
    from_port       = 0
    to_port         = 65535
    protocol        = "tcp"
    security_groups = [aws_security_group.eks_sg.id] # Allow traffic from EKS cluster
  }

  # Allow all outgoing traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

# 🔹 Security Group for RDS Database
resource "aws_security_group" "rds_sg" {
  name   = "rds-security-group"
  vpc_id = var.vpc_id

  # Allow inbound database traffic from ALB and EKS
  ingress {
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    security_groups = [
      aws_security_group.alb_sg.id, # ALB can access RDS
      aws_security_group.eks_sg.id  # EKS can access RDS
    ]
  }

  # Allow all outgoing traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}
