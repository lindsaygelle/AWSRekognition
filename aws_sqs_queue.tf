resource "aws_sqs_queue" "s3_object_created_images" {
  delay_seconds             = null
  fifo_queue                = false
  name                      = "${local.organization}-s3-object-created-images"
  max_message_size          = null
  message_retention_seconds = 60
  receive_wait_time_seconds = null
  tags = {
    bucket                      = aws_s3_bucket.main.bucket
    bucket_key                  = aws_s3_object.images.key
    caller_identity_account_arn = data.aws_caller_identity.main.arn
    caller_identity_account_id  = data.aws_caller_identity.main.account_id
    caller_identity_user_id     = data.aws_caller_identity.main.user_id
    canonical_user_id           = data.aws_canonical_user_id.main.id
    organization                = local.organization
    region                      = data.aws_region.main.name
    workspace                   = terraform.workspace
  }
  visibility_timeout_seconds = null
}
