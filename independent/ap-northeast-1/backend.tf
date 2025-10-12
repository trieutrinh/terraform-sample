terraform {
  backend "s3" {
    bucket = "trieu-s3backend"
    key    = "independent/ap-northeast-1/default.tfstate"
    region = "ap-southeast-1"
  }
}
