resource "aws_s3_bucket_logging" "main" {
  bucket        = aws_s3_bucket.main.bucket
  target_bucket = aws_s3_bucket.main.bucket
  target_prefix = aws_s3_object.log.key
}
