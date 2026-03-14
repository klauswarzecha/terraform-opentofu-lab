resource "random_id" "suffix" {
  byte_length = 3
}

locals {
  bucket_name = "lab-08-lifecycle-${random_id.suffix.hex}"
}

resource "aws_s3_bucket" "lab" {
  bucket        = local.bucket_name
  force_destroy = true

  tags = {
    Name        = local.bucket_name
    Lab         = "08"
    Environment = "lab"

  }


  lifecycle {
    prevent_destroy = true

    ignore_changes = [
      tags["Environment"]
    ]
  }
}
