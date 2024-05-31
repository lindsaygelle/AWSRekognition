resource "aws_pipes_pipe" "sfn_state_machine_rekognition" {
  depends_on = [
    aws_iam_role_policy.pipes_pipe_s3_object_created_image
  ]
  name     = aws_sfn_state_machine.rekognition.name
  role_arn = aws_iam_role.pipes_pipe_s3_object_created_image.arn
  source   = aws_sqs_queue.s3_object_created_image.arn
  target   = aws_sfn_state_machine.rekognition.arn
  target_parameters {
    step_function_state_machine_parameters {
      invocation_type = "FIRE_AND_FORGET"
    }
  }
}
