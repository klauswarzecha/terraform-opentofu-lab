resource "aws_vpc" "lab" {
  cidr_block = "10.20.0.0/16"

  tags = {
    Name = "count-vpc-lab"
  }
}

resource "aws_subnet" "count_subnets" {
  count = length(var.subnet_cidrs)

  vpc_id     = aws_vpc.lab.id
  cidr_block = var.subnet_cidrs[count.index]

  tags = {
    Name = "count-subnet-${count.index}"
  }
}