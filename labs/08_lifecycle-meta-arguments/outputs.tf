output "bucket_name" {
  description = "Name of the lifecycle demo bucket."
  value       = aws_s3_bucket.lab.bucket
}