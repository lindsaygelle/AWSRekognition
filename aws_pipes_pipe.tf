resource "aws_pipes_pipe" "sfn_state_machine_s3_object_created_images" {
  depends_on = [
    aws_iam_role_policy.pipes_pipe_s3_object_created_images
  ]
  name     = aws_sfn_state_machine.s3_object_created_images.name
  role_arn = aws_iam_role.pipes_pipe_s3_object_created_images.arn
  source   = aws_sqs_queue.s3_object_created_images.arn
  target   = aws_sfn_state_machine.s3_object_created_images.arn
  target_parameters {
    step_function_state_machine_parameters {
      invocation_type = "FIRE_AND_FORGET"
    }
  }
}
