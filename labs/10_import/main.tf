resource "aws_s3_bucket" "imported" {
  bucket = var.bucket_name
}