resource "aws_s3_bucket_metric" "main_log" {
  bucket = aws_s3_bucket.main.bucket
  filter {
    prefix = aws_s3_object.log.key
  }
  name = "log"
}
