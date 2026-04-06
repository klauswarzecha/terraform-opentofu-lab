resource "random_id" "this" {
  byte_length = 3
}


resource "aws_s3_bucket" "this" {
  for_each = var.bucket_definitions
  bucket   = "${var.lab_name}-${each.key}-${random_id.this.hex}"
  tags     = merge(each.value.tags, var.general_buckets_tags)
}


locals {
  outer_keys        = toset(keys(var.general_buckets_tags))
  inner_keys        = [for k, v in var.bucket_definitions : keys(v.tags)]
  unique_inner_keys = toset(flatten(local.inner_keys))
  common_keys       = setintersection(local.outer_keys, local.unique_inner_keys)
}
