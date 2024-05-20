data "aws_iam_policy_document" "assume_role_pipes_pipe_s3_object_created_images" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    effect = "Allow"
    principals {
      identifiers = ["pipes.amazonaws.com"]
      type        = "Service"
    }
  }
}

data "aws_iam_policy_document" "assume_role_sfn_state_machine_rekognition_detect_faces" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    effect = "Allow"
    principals {
      identifiers = ["states.amazonaws.com"]
      type        = "Service"
    }
  }
}

data "aws_iam_policy_document" "assume_role_sfn_state_machine_s3_object_created_images" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    effect = "Allow"
    principals {
      identifiers = ["states.amazonaws.com"]
      type        = "Service"
    }
  }
}

data "aws_iam_policy_document" "pipes_pipe_s3_object_created_images" {
  statement {
    actions = [
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes",
      "sqs:ReceiveMessage",
    ]
    effect = "Allow"
    resources = [
      aws_sqs_queue.s3_object_created_images.arn
    ]
  }
  statement {
    actions = [
      "states:StartExecution"
    ]
    effect = "Allow"
    resources = [
      aws_sfn_state_machine.s3_object_created_images.arn
    ]
  }
}

data "aws_iam_policy_document" "sfn_state_machine_rekognition_detect_faces" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:GetObjectAcl",
      "s3:GetObjectAttributes",
      "s3:GetObjectTagging",
      "s3:GetObjectVersion",
      "s3:GetObjectVersionAcl",
      "s3:GetObjectVersionAttributes",
      "s3:GetObjectVersionForReplication",
      "s3:GetObjectVersionTagging",
      "s3:GetObjectVersionTorrent",
    ]
    effect = "Allow"
    resources = [
      "${aws_s3_bucket.main.arn}/${aws_s3_object.images.key}*"
    ]
  }


  statement {
    actions = [
      "rekognition:DetectFaces"
    ]
    effect = "Allow"
    resources = [
      "*"
    ]
  }
}

data "aws_iam_policy_document" "sfn_state_machine_s3_object_created_images" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:GetObjectAcl",
      "s3:GetObjectAttributes",
      "s3:GetObjectTagging",
      "s3:GetObjectVersion",
      "s3:GetObjectVersionAcl",
      "s3:GetObjectVersionAttributes",
      "s3:GetObjectVersionForReplication",
      "s3:GetObjectVersionTagging",
      "s3:GetObjectVersionTorrent",
    ]
    effect = "Allow"
    resources = [
      "${aws_s3_bucket.main.arn}/${aws_s3_object.images.key}*"
    ]
  }

  statement {
    actions = [
      "S3:PutObject"
    ]
    effect = "Allow"
    resources = [
      "${aws_s3_bucket.main.arn}/${aws_s3_object.rekognition.key}*",
      "${aws_s3_bucket.main.arn}/${aws_s3_object.s3_bucket_notification.key}*"
    ]
  }

  statement {
    actions = [
      "rekognition:DetectCustomLabels",
      "rekognition:DetectFaces",
      "rekognition:DetectLabels",
      "rekognition:DetectModerationLabels",
      "rekognition:DetectProtectiveEquipment",
      "rekognition:DetectText",
      "rekognition:RecognizeCelebrities"
    ]
    effect = "Allow"
    resources = [
      "*"
    ]
  }
}

data "aws_iam_policy_document" "sqs_queue_s3_bucket_notification_created_images" {
  statement {
    actions = ["SQS:SendMessage"]

    condition {
      test     = "ArnLike"
      values   = [aws_s3_bucket.main.arn]
      variable = "aws:SourceArn"
    }

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }

    resources = [
      aws_sqs_queue.s3_object_created_images.arn
    ]
  }
}
