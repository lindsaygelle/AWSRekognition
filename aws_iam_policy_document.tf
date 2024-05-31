data "aws_iam_policy_document" "assume_role_pipes_pipe_s3_object_created_image" {
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

data "aws_iam_policy_document" "assume_role_sfn_state_machine_rekognition" {
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

data "aws_iam_policy_document" "assume_role_sfn_state_machine_rekognition_detect_labels" {
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

data "aws_iam_policy_document" "assume_role_sfn_state_machine_rekognition_detect_moderation_labels" {
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

data "aws_iam_policy_document" "assume_role_sfn_state_machine_rekognition_detect_protective_equipment" {
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

data "aws_iam_policy_document" "assume_role_sfn_state_machine_rekognition_detect_text" {
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

data "aws_iam_policy_document" "pipes_pipe_s3_object_created_image" {
  statement {
    actions = [
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes",
      "sqs:ReceiveMessage",
    ]
    effect = "Allow"
    resources = [
      aws_sqs_queue.s3_object_created_image.arn
    ]
  }
  statement {
    actions = [
      "states:StartExecution"
    ]
    effect = "Allow"
    resources = [
      "${aws_sfn_state_machine.rekognition.arn}"
    ]
  }
}

data "aws_iam_policy_document" "sfn_state_machine_rekognition" {
  statement {
    actions = [
      "s3:PutObject"
    ]
    effect = "Allow"
    resources = [
      "${aws_s3_bucket.main.arn}/${aws_s3_object.rekognition_detect_faces.key}*",
      "${aws_s3_bucket.main.arn}/${aws_s3_object.rekognition_detect_labels.key}*",
      "${aws_s3_bucket.main.arn}/${aws_s3_object.rekognition_detect_moderation_labels.key}*",
      "${aws_s3_bucket.main.arn}/${aws_s3_object.rekognition_detect_protective_equipment.key}*",
      "${aws_s3_bucket.main.arn}/${aws_s3_object.rekognition_detect_text.key}*"
    ]
  }
  statement {
    actions = [
      "states:StartExecution"
    ]
    effect = "Allow"
    resources = [
      "${aws_sfn_state_machine.rekognition_detect_faces.arn}",
      "${aws_sfn_state_machine.rekognition_detect_labels.arn}",
      "${aws_sfn_state_machine.rekognition_detect_moderation_labels.arn}",
      "${aws_sfn_state_machine.rekognition_detect_protective_equipment.arn}",
      "${aws_sfn_state_machine.rekognition_detect_text.arn}"
    ]
  }

  statement {
    actions = [
      "states:DescribeExecution",
      "states:StopExecution"
    ]
    effect = "Allow"
    resources = [
      "arn:aws:states:${data.aws_region.main.name}:${data.aws_caller_identity.main.account_id}:execution:${aws_sfn_state_machine.rekognition_detect_faces.name}:*",
      "arn:aws:states:${data.aws_region.main.name}:${data.aws_caller_identity.main.account_id}:execution:${aws_sfn_state_machine.rekognition_detect_labels.name}:*",
      "arn:aws:states:${data.aws_region.main.name}:${data.aws_caller_identity.main.account_id}:execution:${aws_sfn_state_machine.rekognition_detect_moderation_labels.name}:*",
      "arn:aws:states:${data.aws_region.main.name}:${data.aws_caller_identity.main.account_id}:execution:${aws_sfn_state_machine.rekognition_detect_protective_equipment.name}:*",
      "arn:aws:states:${data.aws_region.main.name}:${data.aws_caller_identity.main.account_id}:execution:${aws_sfn_state_machine.rekognition_detect_text.name}:*"
    ]
  }

  statement {
    actions = [
      "events:PutTargets",
      "events:PutRule",
      "events:DescribeRule"
    ]
    effect = "Allow"
    resources = [
      "arn:aws:events:${data.aws_region.main.name}:${data.aws_caller_identity.main.account_id}:rule/StepFunctionsGetEventsForStepFunctionsExecutionRule"
    ]
  }
}

data "aws_iam_policy_document" "sfn_state_machine_rekognition_detect_faces" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:GetObjectAttributes",
      "s3:GetObjectVersion"
    ]
    effect = "Allow"
    resources = [
      "${aws_s3_bucket.main.arn}/${aws_s3_object.images.key}*"
    ]
  }

  statement {
    actions = [
      "s3:GetBucketVersioning",
      "s3:ListBucket"
    ]
    effect = "Allow"
    resources = [
      "${aws_s3_bucket.main.arn}"
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

data "aws_iam_policy_document" "sfn_state_machine_rekognition_detect_labels" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:GetObjectAttributes",
      "s3:GetObjectVersion"
    ]
    effect = "Allow"
    resources = [
      "${aws_s3_bucket.main.arn}/${aws_s3_object.images.key}*"
    ]
  }

  statement {
    actions = [
      "s3:GetBucketVersioning",
      "s3:ListBucket"
    ]
    effect = "Allow"
    resources = [
      "${aws_s3_bucket.main.arn}"
    ]
  }

  statement {
    actions = [
      "rekognition:DetectLabels"
    ]
    effect = "Allow"
    resources = [
      "*"
    ]
  }
}

data "aws_iam_policy_document" "sfn_state_machine_rekognition_detect_moderation_labels" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:GetObjectAttributes",
      "s3:GetObjectVersion"
    ]
    effect = "Allow"
    resources = [
      "${aws_s3_bucket.main.arn}/${aws_s3_object.images.key}*"
    ]
  }

  statement {
    actions = [
      "s3:GetBucketVersioning",
      "s3:ListBucket"
    ]
    effect = "Allow"
    resources = [
      "${aws_s3_bucket.main.arn}"
    ]
  }

  statement {
    actions = [
      "rekognition:DetectModerationLabels"
    ]
    effect = "Allow"
    resources = [
      "*"
    ]
  }
}

data "aws_iam_policy_document" "sfn_state_machine_rekognition_detect_protective_equipment" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:GetObjectAttributes",
      "s3:GetObjectVersion"
    ]
    effect = "Allow"
    resources = [
      "${aws_s3_bucket.main.arn}/${aws_s3_object.images.key}*"
    ]
  }

  statement {
    actions = [
      "s3:GetBucketVersioning",
      "s3:ListBucket"
    ]
    effect = "Allow"
    resources = [
      "${aws_s3_bucket.main.arn}"
    ]
  }

  statement {
    actions = [
      "rekognition:DetectProtectiveEquipment"
    ]
    effect = "Allow"
    resources = [
      "*"
    ]
  }
}

data "aws_iam_policy_document" "sfn_state_machine_rekognition_detect_text" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:GetObjectAttributes",
      "s3:GetObjectVersion"
    ]
    effect = "Allow"
    resources = [
      "${aws_s3_bucket.main.arn}/${aws_s3_object.images.key}*"
    ]
  }

  statement {
    actions = [
      "s3:GetBucketVersioning",
      "s3:ListBucket"
    ]
    effect = "Allow"
    resources = [
      "${aws_s3_bucket.main.arn}"
    ]
  }

  statement {
    actions = [
      "rekognition:DetectText"
    ]
    effect = "Allow"
    resources = [
      "*"
    ]
  }
}

data "aws_iam_policy_document" "sqs_queue_s3_bucket_notification_created_image" {
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
      aws_sqs_queue.s3_object_created_image.arn
    ]
  }
}
