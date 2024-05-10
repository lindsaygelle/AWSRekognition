resource "aws_iam_role_policy" "pipes_pipe_s3_object_created_images" {
  policy = data.aws_iam_policy_document.pipes_pipe_s3_object_created_images.json
  role   = aws_iam_role.pipes_pipe_s3_object_created_images.id
}

resource "aws_iam_role_policy" "sfn_state_machine_s3_object_created_images" {
  policy = data.aws_iam_policy_document.sfn_state_machine_s3_object_created_images.json
  role   = aws_iam_role.sfn_state_machine_s3_object_created_images.id
}
