resource "aws_s3_bucket" "lb-logs" {
  bucket = "lb-bucket"
  acl    = "public-read-write"

}

resource "aws_s3_bucket" "build-logs" {
  bucket = "build-bucket"
  acl    = "public-read-write"

}

