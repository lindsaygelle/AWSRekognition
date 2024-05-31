resource "aws_s3_bucket_metric" "images" {
  bucket = aws_s3_bucket.main.bucket
  filter {
    prefix = aws_s3_object.images.key
  }
  name = trimsuffix(replace(aws_s3_object.images.key, "/", "-"), "-")
}

resource "aws_s3_bucket_metric" "logs" {
  bucket = aws_s3_bucket.main.bucket
  filter {
    prefix = aws_s3_object.logs.key
  }
  name = trimsuffix(replace(aws_s3_object.logs.key, "/", "-"), "-")
}
