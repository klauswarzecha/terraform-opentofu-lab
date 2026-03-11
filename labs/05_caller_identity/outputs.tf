output "account_id" {
  description = "AWS account ID of the caller."
  value       = data.aws_caller_identity.current.account_id
}

output "name_prefix" {
  description = "Prefix used for naming resources in this lab."
  value       = local.name_prefix
}

output "common_tags" {
  description = "Computed common tags for this lab."
  value       = local.common_tags
}

output "bucket_name" {
  description = "Name of the created bucket."
  value       = module.example_bucket.bucket_name
}

output "bucket_arn" {
  description = "ARN of the created bucket."
  value       = module.example_bucket.bucket_arn
}

