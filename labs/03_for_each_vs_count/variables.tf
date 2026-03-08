variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "subnet_cidrs" {
  description = "Two subnet CIDR blocks"
  type        = list(string)

  default = [
    "10.20.1.0/24",
    "10.20.2.0/24"
  ]
}