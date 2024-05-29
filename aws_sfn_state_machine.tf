resource "aws_sfn_state_machine" "rekognition_detect_faces" {
  definition = templatefile("./state_machine/RekognitionDetectFaces.json", {})
  name       = "rekognition-detect-faces"
  role_arn   = aws_iam_role.sfn_state_machine_rekognition_detect_faces.arn
  tags = {
    bucket                      = aws_s3_bucket.main.bucket
    bucket_key                  = aws_s3_object.images.key
    caller_identity_account_arn = data.aws_caller_identity.main.arn
    caller_identity_account_id  = data.aws_caller_identity.main.account_id
    caller_identity_user_id     = data.aws_caller_identity.main.user_id
    canonical_user_id           = data.aws_canonical_user_id.main.id
    organization                = local.organization
    rekognition                 = "DetectFaces"
    region                      = data.aws_region.main.name
    workspace                   = terraform.workspace
  }
}

resource "aws_sfn_state_machine" "rekognition_detect_labels" {
  definition = templatefile("./state_machine/RekognitionDetectLabels.json", {})
  name       = "rekognition-detect-labels"
  role_arn   = aws_iam_role.sfn_state_machine_rekognition_detect_labels.arn
  tags = {
    bucket                      = aws_s3_bucket.main.bucket
    bucket_key                  = aws_s3_object.images.key
    caller_identity_account_arn = data.aws_caller_identity.main.arn
    caller_identity_account_id  = data.aws_caller_identity.main.account_id
    caller_identity_user_id     = data.aws_caller_identity.main.user_id
    canonical_user_id           = data.aws_canonical_user_id.main.id
    organization                = local.organization
    rekognition                 = "DetectLabels"
    region                      = data.aws_region.main.name
    workspace                   = terraform.workspace
  }
}

resource "aws_sfn_state_machine" "rekognition_detect_moderation_labels" {
  definition = templatefile("./state_machine/RekognitionDetectModerationLabels.json", {})
  name       = "rekognition-detect-moderation-labels"
  role_arn   = aws_iam_role.sfn_state_machine_rekognition_detect_moderation_labels.arn
  tags = {
    bucket                      = aws_s3_bucket.main.bucket
    bucket_key                  = aws_s3_object.images.key
    caller_identity_account_arn = data.aws_caller_identity.main.arn
    caller_identity_account_id  = data.aws_caller_identity.main.account_id
    caller_identity_user_id     = data.aws_caller_identity.main.user_id
    canonical_user_id           = data.aws_canonical_user_id.main.id
    organization                = local.organization
    rekognition                 = "DetectModerationLabels"
    region                      = data.aws_region.main.name
    workspace                   = terraform.workspace
  }
}

resource "aws_sfn_state_machine" "rekognition_detect_protective_equipment" {
  definition = templatefile("./state_machine/RekognitionDetectProtectiveEquipment.json", {})
  name       = "rekognition-detect-protective-equipment"
  role_arn   = aws_iam_role.sfn_state_machine_rekognition_detect_protective_equipment.arn
  tags = {
    bucket                      = aws_s3_bucket.main.bucket
    bucket_key                  = aws_s3_object.images.key
    caller_identity_account_arn = data.aws_caller_identity.main.arn
    caller_identity_account_id  = data.aws_caller_identity.main.account_id
    caller_identity_user_id     = data.aws_caller_identity.main.user_id
    canonical_user_id           = data.aws_canonical_user_id.main.id
    organization                = local.organization
    rekognition                 = "DetectProtectiveEquipment"
    region                      = data.aws_region.main.name
    workspace                   = terraform.workspace
  }
}

resource "aws_sfn_state_machine" "rekognition_detect_text" {
  definition = templatefile("./state_machine/RekognitionDetectText.json", {})
  name       = "rekognition-detect-text"
  role_arn   = aws_iam_role.sfn_state_machine_rekognition_detect_text.arn
  tags = {
    bucket                      = aws_s3_bucket.main.bucket
    bucket_key                  = aws_s3_object.images.key
    caller_identity_account_arn = data.aws_caller_identity.main.arn
    caller_identity_account_id  = data.aws_caller_identity.main.account_id
    caller_identity_user_id     = data.aws_caller_identity.main.user_id
    canonical_user_id           = data.aws_canonical_user_id.main.id
    organization                = local.organization
    rekognition                 = "DetectText"
    region                      = data.aws_region.main.name
    workspace                   = terraform.workspace
  }
}
