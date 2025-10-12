resource "aws_s3_bucket" "example" {
  bucket = "trieu-sample-terraform-10072025-production"

  tags = {
    Name        = "trieu-sample-terraform-10072025-production"
    Environment = "Prod"
    Terraform   = "true"
  }
}
