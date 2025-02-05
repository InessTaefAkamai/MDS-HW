# --------------------------------------
# S3 Bucket for Static Content
# --------------------------------------
resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket_name
  force_destroy = var.force_destroy
}

# --------------------------------------
# S3 Bucket Public Access Block (Security)
# --------------------------------------
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.s3_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# --------------------------------------
# S3 Bucket Versioning
# --------------------------------------
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.s3_bucket.id

  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}

# --------------------------------------
# S3 Bucket Logging (Optional)
# --------------------------------------
resource "aws_s3_bucket_logging" "logging" {
  count  = var.enable_logging ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket.id

  target_bucket = var.logging_bucket
  target_prefix = "logs/"
}

# --------------------------------------
# S3 Bucket Policy for CloudFront (Optional)
# --------------------------------------
resource "aws_s3_bucket_policy" "s3_policy" {
  count  = var.enable_cloudfront_access ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "cloudfront.amazonaws.com"
        },
        Action = "s3:GetObject",
        Resource = "arn:aws:s3:::${aws_s3_bucket.s3_bucket.id}/*",
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = var.cloudfront_distribution_arn
          }
        }
      }
    ]
  })
}

# --------------------------------------
# S3 Bucket Static Website Hosting (Optional)
# --------------------------------------
resource "aws_s3_bucket_website_configuration" "website" {
  count  = var.enable_website_hosting ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
