aws_region = "us-east-1"

# VPC Configuration
vpc_cidr          = "10.0.0.0/16"
private_subnets   = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnets    = ["10.0.3.0/24", "10.0.4.0/24"]

# EKS Configuration
eks_cluster_name       = "cat-health-cluster"
eks_cluster_version    = "1.30"
eks_node_instance_type = "t3.medium"

# RDS Configuration
db_instance_class = "db.t3.medium"
db_engine         = "postgres"
db_username       = "admin"
db_password       = "securepassword123"

# S3 Bucket Configuration
s3_bucket_name = "cat-health-frontend"

# CloudFront
cloudfront_price_class = "PriceClass_100"

# API Gateway
api_gateway_name = "cat-health-api"

# Load Balancer
lb_name = "cat-health-alb"

# Route 53
domain_name = "cat-health.com"

# WAF
waf_name = "cat-health-waf"

# Secrets Manager
okta_org       = "your-okta-org"
okta_api_token = "your-secure-api-token"
