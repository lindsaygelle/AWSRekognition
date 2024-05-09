resource "aws_s3_object" "log" {
  acl              = "private"
  bucket           = aws_s3_bucket.main.bucket
  content_language = "en-US"
  content_type     = "application/x-directory"
  force_destroy    = true
  key              = "log/"
}
