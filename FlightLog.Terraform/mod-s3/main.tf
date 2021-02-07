resource "aws_s3_bucket" "lb-logs" {
  bucket = "bweb-lb-bucket"
  acl    = "private"

}

resource "aws_s3_bucket" "build-logs" {
  bucket = "bweb-build-bucket"
  acl    = "private"

}

resource "aws_s3_bucket" "artifacts" {
  bucket = "bweb-artifacts"
  acl    = "private"

}

