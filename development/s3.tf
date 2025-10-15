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
  source        = "terraform-aws-modules/s3-bucket/aws"
  version       = "5.7.0"
  create_bucket = true
  bucket        = "development-trieu-policy-new"

  control_object_ownership = true
  object_ownership         = "BucketOwnerPreferred"

  block_public_acls   = false
  block_public_policy = false
  ignore_public_acls  = false
  attach_policy       = true
  policy              = data.aws_iam_policy_document.bucket_policy.json

  skip_destroy_public_access_block = false
}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid    = "PutObjPolicy"
    effect = "Allow"
    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "arn:aws:s3:::${module.s3_bucket.s3_bucket_id}/*",
    ]
  }
}
