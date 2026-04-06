output "bucket" {
  value = aws_s3_bucket.this
}

output "bucket_names" {
  value = {
    for k, v in aws_s3_bucket.this : k => v.bucket
  }
}


# output "outer_keys" {
#   value = local.outer_keys
# }

# output "inner_keys" {
#   value = local.inner_keys
# }

# output "unique_inner_keys" {
#   value = local.unique_inner_keys
# }

output "common_keys" {
  value = local.common_keys
}
