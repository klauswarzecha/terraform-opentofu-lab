
resource "random_id" "this" {
  byte_length = 3
}

resource "aws_s3_bucket" "this" {
  for_each = var.bucket_definitions_simple
  bucket   = "${each.key}-${random_id.this.hex}"
  tags = {
    Purpose = "${each.key}-storage"
  }
}
