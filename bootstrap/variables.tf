variable "aws_region" {
  type        = string
  description = "AWS region for all resources."
  default     = "eu-central-1"
}

variable "project_name" {
  type        = string
  description = "Project name used for naming."
  default     = "terraform-opentofu-lab"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to all resources via provider default_tags."
  default = {
    Project   = "terraform-opentofu-lab"
    ManagedBy = "terraform"
    Toolchain = "opentofu"
    Layer     = "bootstrap"
  }
}