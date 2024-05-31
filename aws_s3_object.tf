resource "aws_s3_object" "images" {
  acl              = "private"
  bucket           = aws_s3_bucket.main.bucket
  content_language = "en-US"
  content_type     = "application/x-directory"
  force_destroy    = true
  key              = "images/"
}

resource "aws_s3_object" "logs" {
  acl              = "private"
  bucket           = aws_s3_bucket.main.bucket
  content_language = "en-US"
  content_type     = "application/x-directory"
  force_destroy    = true
  key              = "logs/"
}

resource "aws_s3_object" "rekognition" {
  acl              = "private"
  bucket           = aws_s3_bucket.main.bucket
  content_language = "en-US"
  content_type     = "application/x-directory"
  force_destroy    = true
  key              = "rekognition/"
}

resource "aws_s3_object" "rekognition_detect_faces" {
  acl              = "private"
  bucket           = aws_s3_bucket.main.bucket
  content_language = "en-US"
  content_type     = "application/x-directory"
  force_destroy    = true
  key              = "${aws_s3_object.rekognition.key}detect_faces/"
}

resource "aws_s3_object" "rekognition_detect_labels" {
  acl              = "private"
  bucket           = aws_s3_bucket.main.bucket
  content_language = "en-US"
  content_type     = "application/x-directory"
  force_destroy    = true
  key              = "${aws_s3_object.rekognition.key}detect_labels/"
}

resource "aws_s3_object" "rekognition_detect_moderation_labels" {
  acl              = "private"
  bucket           = aws_s3_bucket.main.bucket
  content_language = "en-US"
  content_type     = "application/x-directory"
  force_destroy    = true
  key              = "${aws_s3_object.rekognition.key}detect_moderation_labels/"
}

resource "aws_s3_object" "rekognition_detect_protective_equipment" {
  acl              = "private"
  bucket           = aws_s3_bucket.main.bucket
  content_language = "en-US"
  content_type     = "application/x-directory"
  force_destroy    = true
  key              = "${aws_s3_object.rekognition.key}detect_protective_equipment/"
}

resource "aws_s3_object" "rekognition_detect_text" {
  acl              = "private"
  bucket           = aws_s3_bucket.main.bucket
  content_language = "en-US"
  content_type     = "application/x-directory"
  force_destroy    = true
  key              = "${aws_s3_object.rekognition.key}detect_text/"
}
