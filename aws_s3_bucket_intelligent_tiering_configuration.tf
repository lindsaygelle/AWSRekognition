resource "aws_s3_bucket_intelligent_tiering_configuration" "main_log" {
  bucket = aws_s3_bucket.main.bucket
  filter {
    prefix = aws_s3_object.log.key
  }
  name   = "log"
  status = "Enabled"
  tiering {
    access_tier = "ARCHIVE_ACCESS"
    days        = 180
  }
}
