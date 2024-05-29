resource "aws_iam_role" "sfn_state_machine_rekognition_detect_faces" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_sfn_state_machine_rekognition_detect_faces.json
  name               = "sfn-state-machine-rekognition-detect-faces"
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

resource "aws_iam_role" "sfn_state_machine_rekognition_detect_labels" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_sfn_state_machine_rekognition_detect_labels.json
  name               = "sfn-state-machine-rekognition-detect-labels"
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

resource "aws_iam_role" "sfn_state_machine_rekognition_detect_moderation_labels" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_sfn_state_machine_rekognition_detect_moderation_labels.json
  name               = "sfn-state-machine-rekognition-detect-moderation-labels"
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

resource "aws_iam_role" "sfn_state_machine_rekognition_detect_protective_equipment" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_sfn_state_machine_rekognition_detect_protective_equipment.json
  name               = "sfn-state-machine-rekognition-detect-protective-equipment"
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
