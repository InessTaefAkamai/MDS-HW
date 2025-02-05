terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
    okta = {
      source  = "oktadeveloper/okta"
      version = ">= 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "okta" {
  org_name  = var.okta_org
  base_url  = "okta.com"
  api_token = var.okta_api_token
}

# ------------------------------
# VPC MODULE
# ------------------------------
module "vpc" {
  source = "./modules/vpc"
  aws_region = var.aws_region
}

# ------------------------------
# EKS (Kubernetes) Cluster
# ------------------------------
module "eks" {
  source      = "./modules/eks"
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.private_subnets
}

# ------------------------------
# Amazon RDS (PostgreSQL)
# ------------------------------
module "rds" {
  source            = "./modules/rds"
  vpc_id            = module.vpc.vpc_id
  db_username       = var.db_username
  db_password       = var.db_password
  subnet_ids        = module.vpc.private_subnets
}

# ------------------------------
# Amazon ElastiCache (Redis)
# ------------------------------
module "elasticache" {
  source      = "./modules/elasticache"
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.private_subnets
}

# ------------------------------
# API Gateway
# ------------------------------
module "api_gateway" {
  source = "./modules/api_gateway"
}

# ------------------------------
# AWS Lambda
# ------------------------------
module "lambda" {
  source = "./modules/lambda"
}

# ------------------------------
# AWS SQS (Message Queue)
# ------------------------------
module "sqs" {
  source = "./modules/sqs"
}

# ------------------------------
# AWS S3 (Static Content)
# ------------------------------
module "s3" {
  source = "./modules/s3"
}

# ------------------------------
# AWS CloudFront (CDN)
# ------------------------------
module "cloudfront" {
  source = "./modules/cloudfront"
}

# ------------------------------
# Load Balancer
# ------------------------------
module "load_balancer" {
  source = "./modules/load_balancer"
  vpc_id = module.vpc.vpc_id
}

# ------------------------------
# Route 53 (DNS)
# ------------------------------
module "route53" {
  source = "./modules/route53"
}

# ------------------------------
# AWS WAF (Web Application Firewall)
# ------------------------------
module "waf" {
  source = "./modules/waf"
}

# ------------------------------
# AWS Secrets Manager
# ------------------------------
module "secrets_manager" {
  source = "./modules/secrets-manager"
}

# ------------------------------
# CloudWatch Monitoring
# ------------------------------
module "cloudwatch" {
  source = "./modules/cloudwatch"
}
