resource "aws_vpc" "lab" {
  cidr_block = "10.90.0.0/16"

  tags = {
    Name = "lab-09-vpc"
  }
}

resource "aws_security_group" "example" {
  name        = var.sg_name
  description = "Lifecycle replacement demo"
  vpc_id      = aws_vpc.lab.id

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = var.sg_name
    Lab  = "09"
  }
}