variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "subnet_cidrs" {
  description = "Subnet CIDR blocks keyed by logical subnet name."
  type        = map(string)

  default = {
    public_x        = "10.20.99.0/24"
    public_subnet_a = "10.20.1.0/24"
    public_subnet_b = "10.20.2.0/24"
  }
}