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
  default     = "terraform-opentofu-lab"
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
    "logs" = {
      tags = {}
    },
    "export" = {
      tags = {}
    },
    images = {
      tags = {}
    },
    videos = {
      tags = {}
    }
  }
}







