resource "aws_sqs_queue_policy" "s3_object_created_images" {
  policy    = data.aws_iam_policy_document.sqs_queue_s3_bucket_notification_created_images.json
  queue_url = aws_sqs_queue.s3_object_created_images.id
}
