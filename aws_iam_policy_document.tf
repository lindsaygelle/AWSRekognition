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
