resource "aws_s3_bucket_logging" "main" {
  bucket                = aws_s3_bucket.main.bucket
  expected_bucket_owner = data.aws_caller_identity.main.account_id
  target_bucket         = aws_s3_bucket.main.bucket
  target_object_key_format {
    partitioned_prefix {
      partition_date_source = "EventTime"
    }
  }
  target_prefix = aws_s3_object.logs.key
}
