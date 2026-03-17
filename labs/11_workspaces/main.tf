resource "random_id" "suffix" {
  byte_length = 2
}

locals {
  bucket_name = "lab-11-${terraform.workspace}-${random_id.suffix.hex}"
}

resource "aws_s3_bucket" "workspace_bucket" {
  bucket = local.bucket_name

  tags = {
    Workspace = terraform.workspace
    Lab       = "11"
  }
}