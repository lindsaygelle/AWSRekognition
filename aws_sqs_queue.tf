resource "aws_sqs_queue" "s3_object_created_image" {
  name                      = "s3-object-created-images"
  message_retention_seconds = 86400
  tags = {
    account_arn  = data.aws_caller_identity.main.arn
    account_id   = data.aws_caller_identity.main.account_id
    bucket       = aws_s3_bucket.main.id
    bucket_key   = aws_s3_object.images.key
    organization = local.organization
    region       = data.aws_region.main.name
    workspace    = terraform.workspace
  }
}
