output "bucket" {
  value = aws_s3_bucket.this
}

output "bucket_names" {
  value = {
    for k, v in aws_s3_bucket.this : k => v.bucket
  }
}


output "bucket_team" {
  value = {
    for k, v in aws_s3_bucket.this.tags_all : k => v[Team]
  }
}

