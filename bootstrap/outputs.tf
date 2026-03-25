output "state_bucket_name" {
  description = "Name of the S3 bucket used for remote state."
  value       = aws_s3_bucket.tf_state.bucket
}

output "aws_region" {
  description = "AWS region used by this bootstrap stack."
  value       = var.aws_region
}
