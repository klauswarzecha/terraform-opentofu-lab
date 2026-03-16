variable "aws_region" {
  description = "AWS region for the lab"
  type        = string
  default     = "eu-central-1"
}

variable "bucket_name" {
  description = "Name of the existing S3 bucket to import"
  type = string
}