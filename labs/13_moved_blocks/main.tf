resource "aws_vpc" "core" {
  cidr_block           = "10.130.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "lab-13-vpc"
    Lab  = "13"
  }
}

moved {
  from = aws_vpc.main
  to   = aws_vpc.core
}