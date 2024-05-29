resource "aws_iam_role_policy" "sfn_state_machine_rekognition_detect_faces" {
  policy = data.aws_iam_policy_document.sfn_state_machine_rekognition_detect_faces.json
  role   = aws_iam_role.sfn_state_machine_rekognition_detect_faces.id
}

resource "aws_iam_role_policy" "sfn_state_machine_rekognition_detect_labels" {
  policy = data.aws_iam_policy_document.sfn_state_machine_rekognition_detect_labels.json
  role   = aws_iam_role.sfn_state_machine_rekognition_detect_labels.id
}

resource "aws_iam_role_policy" "sfn_state_machine_rekognition_detect_moderation_labels" {
  policy = data.aws_iam_policy_document.sfn_state_machine_rekognition_detect_moderation_labels.json
  role   = aws_iam_role.sfn_state_machine_rekognition_detect_moderation_labels.id
}

resource "aws_iam_role_policy" "sfn_state_machine_rekognition_detect_protective_equipment" {
  policy = data.aws_iam_policy_document.sfn_state_machine_rekognition_detect_protective_equipment.json
  role   = aws_iam_role.sfn_state_machine_rekognition_detect_protective_equipment.id
}
