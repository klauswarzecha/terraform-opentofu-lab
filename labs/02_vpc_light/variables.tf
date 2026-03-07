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
  description = "Tags applied to all lab resources."

  default = {
    Project   = "terraform-opentofu-lab"
    ManagedBy = "terraform"
    Toolchain = "opentofu"
    Layer     = "lab"
    Lab       = "02_vpc_light"
  }
}