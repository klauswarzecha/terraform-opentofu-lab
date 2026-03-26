variable "aws_region" {
  description = "The AWS region for the lab."
  type = string
  default = "eu-central-1"
}

variable "bucket_definitions_simple" {
  description = "Simple definitions of the S3 buckets to create."
  type        = map(string)
  default = {
    "images"  = "image-storage"
    "logs"    = "log-storage"
    "exports" = "export-storage"
  }
}

