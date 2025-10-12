terraform {
  backend "s3" {
    bucket = "trieu-s3backend"
    key    = "production/default.tfstate"
    region = "ap-southeast-1"
  }
}
