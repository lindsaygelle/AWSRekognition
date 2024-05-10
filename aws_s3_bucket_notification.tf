resource "aws_s3_bucket_notification" "main" {
  bucket = aws_s3_bucket.main.id

  queue {
    events        = ["s3:ObjectCreated:*"]
    filter_prefix = aws_s3_object.images.key
    id            = aws_sqs_queue.s3_object_created_images.id
    queue_arn     = aws_sqs_queue.s3_object_created_images.arn
  }
}
