resource "aws_s3_bucket" "lb-logs" {
  bucket = "lb-bucket"
  acl    = "public"

}

resource "aws_s3_bucket" "build-logs" {
  bucket = "build-bucket"
  acl    = "public"

}

