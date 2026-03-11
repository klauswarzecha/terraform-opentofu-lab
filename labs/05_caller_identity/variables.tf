variable "aws_region" {
  description = "AWS region for the lab."
  type        = string
  default     = "eu-central-1"
}

variable "lab_id" {
  description = "Lab identifier used in resource names."
  type        = string
  default     = "05"

  validation {
    condition     = can(regex("^[0-9]{2}$", var.lab_id))
    error_message = "lab_id must be a two-digit string such as '01', '05', or '12'."
  }
}

variable "base_tags" {
  description = "Base tags for resources created in this lab."
  type        = map(string)
  default = {
    ManagedBy = "terraform"
    Toolchain = "opentofu"
    Layer     = "lab"
  }
}