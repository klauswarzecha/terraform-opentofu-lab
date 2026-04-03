variable "aws_region" {
  description = "The AWS region for the lab."
  type        = string
  default     = "eu-central-1"
}

variable "project_name" {
  type        = string
  description = "Project name used for naming."
  default     = "terraform-opentofu-lab"
}

variable "lab_name" {
  type        = string
  description = "Lab name used for tags."
  default     = "lab-18"
}

variable "general_buckets_tags" {
  type        = map(string)
  description = "Tags applied to all lab resources."
  default = {
    Project   = "terraform-opentofu-lab"
    ManagedBy = "terraform"
    Toolchain = "opentofu"
    Layer     = "lab"
  }
}

variable "bucket_definitions" {
  description = "Definition of all buckets and their properties."
  type = map(object({
    tags = map(string)
  }))
  default = {
    # "logs" = {
    #   tags = {}
    # },   
  }

  validation {
    condition     = var.bucket_definitions != null
    error_message = "The bucket definitions are empty."
  }

  validation {
    condition     = alltrue([for k, v in var.bucket_definitions : can(regex("^[a-z0-9-]+$", k))])
    error_message = "The bucket name contains invalid characters."
  }

  validation {
    condition     = alltrue([for k, v in var.bucket_definitions : contains(keys(v.tags), "Purpose")])
    error_message = "Each bucket must have 'Purpose' tag."
  }

  validation {
    condition     = alltrue([for k, v in var.bucket_definitions : length(k) >= 3])
    error_message = "Each bucket label must be longer than three characters."
  }
}






