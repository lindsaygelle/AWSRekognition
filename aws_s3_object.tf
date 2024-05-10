resource "aws_s3_object" "images" {
  acl              = "private"
  bucket           = aws_s3_bucket.main.bucket
  content_language = "en-US"
  content_type     = "application/x-directory"
  force_destroy    = true
  key              = "images/"
}

resource "aws_s3_object" "logs" {
  acl              = "private"
  bucket           = aws_s3_bucket.main.bucket
  content_language = "en-US"
  content_type     = "application/x-directory"
  force_destroy    = true
  key              = "logs/"
}

resource "aws_s3_object" "rekognition" {
  acl              = "private"
  bucket           = aws_s3_bucket.main.bucket
  content_language = "en-US"
  content_type     = "application/x-directory"
  force_destroy    = true
  key              = "rekognition/"
}

resource "aws_s3_object" "s3_bucket_notification" {
  acl              = "private"
  bucket           = aws_s3_bucket.main.bucket
  content_language = "en-US"
  content_type     = "application/x-directory"
  force_destroy    = true
  key              = "s3_bucket_notification/"
}
