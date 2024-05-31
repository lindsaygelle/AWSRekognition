resource "aws_s3_bucket_intelligent_tiering_configuration" "images" {
  bucket = aws_s3_bucket.main.bucket
  filter {
    prefix = aws_s3_object.images.key
  }
  name   = trimsuffix(replace(aws_s3_object.images.key, "/", "-"), "-")
  status = "Enabled"
  tiering {
    access_tier = "ARCHIVE_ACCESS"
    days        = 180
  }
}

resource "aws_s3_bucket_intelligent_tiering_configuration" "logs" {
  bucket = aws_s3_bucket.main.bucket
  filter {
    prefix = aws_s3_object.logs.key
  }
  name   = trimsuffix(replace(aws_s3_object.logs.key, "/", "-"), "-")
  status = "Enabled"
  tiering {
    access_tier = "ARCHIVE_ACCESS"
    days        = 180
  }
}
