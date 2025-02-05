output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.s3_bucket.bucket
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.s3_bucket.arn
}

output "s3_bucket_domain_name" {
  description = "Public domain name of the S3 bucket"
  value       = aws_s3_bucket.s3_bucket.bucket_domain_name
}

output "s3_bucket_id" {
  description = "The ID of the S3 bucket"
  value       = aws_s3_bucket.s3_bucket.id
}
