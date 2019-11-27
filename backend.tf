terraform {
  required_version = "0.12.16"
  backend "s3" {
    bucket = "yolo-terraform"
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
  }
}
