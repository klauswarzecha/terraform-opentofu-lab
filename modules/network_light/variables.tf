variable "name_prefix" {
  type        = string
  description = "Prefix used for Name tags."
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC."
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Exactly two CIDR blocks for public subnets."

  validation {
    condition     = length(var.public_subnet_cidrs) == 2
    error_message = "public_subnet_cidrs must contain exactly 2 CIDR blocks."
  }

  validation {
    condition     = length(toset(var.public_subnet_cidrs)) == 2
    error_message = "public_subnet_cidrs must not contain duplicates."
  }
}

variable "tags" {
  type        = map(string)
  description = "Extra tags to apply to resources."
  default     = {}
}