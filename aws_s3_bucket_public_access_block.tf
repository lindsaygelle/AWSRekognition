resource "aws_s3_bucket_public_access_block" "main" {
  block_public_acls       = false
  block_public_policy     = true
  bucket                  = aws_s3_bucket_acl.main.bucket
  ignore_public_acls      = true
  restrict_public_buckets = true
}
