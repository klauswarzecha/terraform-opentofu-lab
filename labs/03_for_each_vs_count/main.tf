resource "aws_vpc" "lab" {
  cidr_block = "10.20.0.0/16"

  tags = {
    Name = "for-each-vs-count-vpc-lab"
  }
}

resource "aws_subnet" "foreach_subnets" {
  for_each = var.subnet_cidrs

  vpc_id     = aws_vpc.lab.id
  cidr_block = each.value

  tags = {
    Name = "foreach-subnet-${each.key}"
  }
}