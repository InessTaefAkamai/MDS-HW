resource "aws_s3_bucket" "logs" {
  bucket = var.bucket_name
  acl    = "private"
}
