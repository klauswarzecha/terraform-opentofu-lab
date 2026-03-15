variable "aws_region" {
  description = "AWS region for the lab."
  type        = string
  default     = "eu-central-1"
}

variable "sg_name" {
  description = "Security group name."
  type        = string
  default     = "lab-09-sg"
}