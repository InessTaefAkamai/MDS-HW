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
