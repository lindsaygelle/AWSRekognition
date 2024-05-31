resource "aws_sqs_queue_policy" "s3_object_created_image" {
  policy    = data.aws_iam_policy_document.sqs_queue_s3_bucket_notification_created_image.json
  queue_url = aws_sqs_queue.s3_object_created_image.id
}
