module "api_gateway" {
  source = "./modules/api-gw"
  api_name = "cat-health-api"
}

module "eks" {
  source = "./modules/eks"
  cluster_name = "eks-cat-health"
  subnet_ids   = module.networking.subnet_ids
}

module "load_balancer" {
  source = "./modules/load-balancer"
  alb_name = "app-load-balancer"
}

module "rds" {
  source = "./modules/rds"
  db_name = "cat_health_db"
  instance_type = "db.t3.micro"
}

module "security" {
  source = "./modules/security"
}

module "route53" {
  source = "./modules/route53"
  domain_name = "cat-health.com"
}

module "s3" {
  source = "./modules/s3"
  bucket_name = "cat-health-monitoring-logs"
}

module "waf" {
  source = "./modules/waf"
}
