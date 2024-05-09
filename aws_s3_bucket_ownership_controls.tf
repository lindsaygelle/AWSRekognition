resource "aws_s3_bucket_ownership_controls" "main" {
  bucket = aws_s3_bucket.main.bucket
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}
