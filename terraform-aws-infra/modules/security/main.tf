# --------------------------------------
# Security Group for ALB (Public Access)
# --------------------------------------
resource "aws_security_group" "alb_sg" {
  name_prefix = "alb-sg-"
  description = "Security group for ALB"
  vpc_id      = var.vpc_id

  # Allow HTTP & HTTPS traffic from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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
# Security Group for RDS (Private Access)
# --------------------------------------
resource "aws_security_group" "rds_sg" {
  name_prefix = "rds-sg-"
  description = "Security group for RDS"
  vpc_id      = var.vpc_id

  # Allow PostgreSQL/MySQL access from application servers only
  ingress {
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    security_groups = [var.application_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# --------------------------------------
# Security Group for ElastiCache (Private Access)
# --------------------------------------
resource "aws_security_group" "elasticache_sg" {
  name_prefix = "elasticache-sg-"
  description = "Security group for ElastiCache"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    security_groups = [var.application_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# --------------------------------------
# IAM Role for Application Services (EKS, Lambda, EC2)
# --------------------------------------
resource "aws_iam_role" "app_role" {
  name = "app-service-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = ["eks.amazonaws.com", "lambda.amazonaws.com", "ec2.amazonaws.com"]
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach necessary policies
resource "aws_iam_role_policy_attachment" "app_role_policy" {
  role       = aws_iam_role.app_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}

# --------------------------------------
# AWS WAF for Application Load Balancer
# --------------------------------------
resource "aws_wafv2_web_acl" "waf" {
  name  = "cat-health-waf"
  scope = "REGIONAL"

  default_action {
    allow {}
  }

  rule {
    name     = "BlockBadIPs"
    priority = 1
    action {
      block {}
    }

    statement {
      ip_set_reference_statement {
        arn = var.waf_blocklist_ip_set_arn
      }
    }

    visibility_config {
      sampled_requests_enabled = true
      cloudwatch_metrics_enabled = true
      metric_name = "BlockBadIPs"
    }
  }
}

resource "aws_wafv2_web_acl_association" "waf_alb_association" {
  resource_arn = var.alb_arn
  web_acl_arn  = aws_wafv2_web_acl.waf.arn
}
