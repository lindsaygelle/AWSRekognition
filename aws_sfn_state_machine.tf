resource "aws_sfn_state_machine" "s3_object_created_images" {
  definition = templatefile("./state_machine/S3ObjectCreatedImages.json", {
    aws_s3_object_rekognition            = aws_s3_object.rekognition.key
    aws_s3_object_s3_bucket_notification = aws_s3_object.s3_bucket_notification.key
  })
  name     = "${local.organization}-s3-object-created-images"
  role_arn = aws_iam_role.sfn_state_machine_s3_object_created_images.arn
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
}
