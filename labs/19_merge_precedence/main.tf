resource "random_id" "this" {
  byte_length = 3
}


resource "aws_s3_bucket" "this" {
  for_each = var.bucket_definitions
  bucket   = "${var.lab_name}-${each.key}-${random_id.this.hex}"
  tags     = merge(each.value.tags, var.general_buckets_tags)

}
