resource "random_id" "suffix" {
  byte_length = 3
}

locals {
  bucket_name = "${var.project_name}-lab-${random_id.suffix.hex}"
}

module "bucket" {
  source      = "../../modules/s3_bucket"
  bucket_name = local.bucket_name
}