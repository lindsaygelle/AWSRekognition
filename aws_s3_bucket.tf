resource "aws_s3_bucket" "main" {
  bucket        = lower("${data.aws_caller_identity.main.account_id}-${local.organization}")
  force_destroy = true
  tags = {
    caller_identity_account_arn = data.aws_caller_identity.main.arn
    caller_identity_account_id  = data.aws_caller_identity.main.account_id
    caller_identity_user_id     = data.aws_caller_identity.main.user_id
    canonical_user_id           = data.aws_canonical_user_id.main.id
    organization                = local.organization
    region                      = data.aws_region.main.name
    workspace                   = terraform.workspace
  }
}
