resource "aws_iam_role" "pipes_pipe_s3_object_created_images" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_pipes_pipe_s3_object_created_images.json
  name               = "${local.organization}-pipes-pipe-s3-object-created-images"
  path               = "/${local.organization}/"
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

resource "aws_iam_role" "sfn_state_machine_s3_object_created_images" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_sfn_state_machine_s3_object_created_images.json
  name               = "${local.organization}-sfn-state-machine-s3-object-created-images"
  path               = "/${local.organization}/"
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
