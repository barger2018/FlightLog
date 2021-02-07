resource "aws_s3_bucket" "lb-logs" {
  bucket = "bweb-lb-bucket"
  acl    = "public-read-write"

}

resource "aws_s3_bucket" "build-logs" {
  bucket = "bweb-build-bucket"
  acl    = "public-read-write"

}

resource "aws_s3_bucket" "artifacts" {
  bucket = "bweb-artifacts"
  acl    = "public-read-write"

}

