resource "aws_s3_bucket" "imported" {
  bucket = var.bucket_name

  tags = {
    Lab = "10"
  }
}