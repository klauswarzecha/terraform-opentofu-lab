
resource "random_id" "this" {
  byte_length = 3
}

locals {
  lab_name = "16-for-each-challenge"

  bucket_map = {
    for label in var.bucket_labels : label => {
      bucket_name = "${label}-${random_id.this.hex}"
      tags = merge(
        var.general_buckets_tags,
        { Purpose = "Storage of ${label}" },
        { Lab = "${local.lab_name}" }
      )
    }
  }
}

resource "aws_s3_bucket" "this" {
  for_each = local.bucket_map
  bucket   = each.key
  tags     = each.value.tags
}

