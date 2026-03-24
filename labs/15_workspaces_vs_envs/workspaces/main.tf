locals {
  bucket_name = "lab-15-${terraform.workspace}-${random_id.suffix.hex}"
}

resource "random_id" "suffix" {
  byte_length = 3
}

resource "aws_s3_bucket" "this" {
  bucket = local.bucket_name
  tags = {
    Lab       = "15"
    Mode      = "workspace"
    Workspace = terraform.workspace
  }
}
