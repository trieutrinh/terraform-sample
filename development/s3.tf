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
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}
