resource "aws_s3_bucket" "example" {
  bucket = "trieu-sample-terraform-10072025-development"

  tags = {
    Name        = "trieu-sample-terraform-10072025-development"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket_lifecycle_configuration" "this" {
  bucket = aws_s3_bucket.example.id
  rule {
    id     = "config"
    status = "Enabled"
    filter {}
    expiration {
      days                         = 1
      expired_object_delete_marker = false
    }
  }
}
module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "development-trieu-policy"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "BucketOwnerPreferred"
  attach_policy            = true
  policy                   = data.aws_iam_policy_document.bucket_policy.json

  versioning = {
    enabled = true
  }
}

resource "aws_iam_role" "this" {
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    principals {
      type        = "AWS"
      identifiers = [aws_iam_role.this.arn]
    }

    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "${module.s3_bucket.bucket_arn}",
    ]
  }
}

