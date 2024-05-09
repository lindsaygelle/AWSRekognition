resource "aws_s3_bucket_versioning" "main" {
  bucket                = aws_s3_bucket.main.bucket
  expected_bucket_owner = data.aws_caller_identity.main.account_id
  versioning_configuration {
    mfa_delete = "Disabled"
    status     = "Disabled"
  }
}
