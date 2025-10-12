terraform {
  backend "s3" {
    bucket = "trieu-s3backend"
    key    = "development/default.tfstate"
    region = "ap-southeast-1"
  }
}
