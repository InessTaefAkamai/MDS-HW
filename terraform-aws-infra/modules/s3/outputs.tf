output "s3_bucket_id" {
  description = "The ID of the S3 bucket"
  value       = aws_s3_bucket.s3_bucket.id
}

output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.s3_bucket.arn
}

output "s3_bucket_domain_name" {
  description = "The domain name of the S3 bucket"
  value       = aws_s3_bucket.s3_bucket.bucket_regional_domain_name
}

output "s3_website_endpoint" {
  description = "The website endpoint (if enabled)"
  value       = var.enable_website_hosting ? aws_s3_bucket_website_configuration.website[0].website_endpoint : null
}
