output "bucket_name" {
  description = "Name of the imported bucket"
  value = aws_s3_bucket.imported.bucket
}