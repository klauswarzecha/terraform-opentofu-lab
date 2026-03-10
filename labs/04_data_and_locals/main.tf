data "aws_availability_zones" "available" {
  state = "available"
}

locals {

  # raw data from AWS
  all_azs = data.aws_availability_zones.available.names

  # select the first two AZs
  selected_azs = slice(local.all_azs, 0, 2)

  # derive a mapping for subnet creation
  subnet_az_map = {
    subnet_a = local.selected_azs[0]
    subnet_b = local.selected_azs[1]
  }

}

resource "aws_vpc" "lab" {
  cidr_block = "10.40.0.0/16"

  tags = {
    Name = "data-locals-vpc-lab"
  }
}

resource "aws_subnet" "example" {
  for_each = local.subnet_az_map

  vpc_id            = aws_vpc.lab.id
  cidr_block        = cidrsubnet("10.40.0.0/16", 8, index(keys(local.subnet_az_map), each.key))
  availability_zone = each.value

  tags = {
    Name = "locals-subnet-${each.key}"
  }
}
