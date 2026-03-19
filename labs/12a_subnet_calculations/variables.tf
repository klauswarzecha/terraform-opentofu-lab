variable "base_cidr" {
  description = "Base CIDR block to split into subnets"
  type        = string
  default     = "10.120.0.0/16"
}

variable "subnet_count" {
  description = "Number of subnets to calculate"
  type        = number
  default     = 8
}

variable "newbits" {
  description = "Number of additional subnet bits"
  type        = number
  default     = 3
}

variable "availability_zones" {
  description = "value"
  type        = list(string)
  default = [
    "eu-central-1a",
    "eu-central-1b",
    "eu-central-1c",
    "eu-central-1a",
    "eu-central-1b",
    "eu-central-1c",
    "eu-central-1a",
    "eu-central-1b",
  ]
}