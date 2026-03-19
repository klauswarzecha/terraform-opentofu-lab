locals {
  subnet_cidrs = [
    for i in range(var.subnet_count) : cidrsubnet(var.base_cidr, var.newbits, i)
  ]

  subnets = {
    for i in range(var.subnet_count) : "public_${i + 1}" => {
      cidr = local.subnet_cidrs[i]
      az   = var.availability_zones[i]
      name = "public-${i + 1}"
    }
  }

  subnet_ids_mock = {
    for key, subnet in local.subnets : key => {
      id   = "subnet-mock-${key}"
      cidr = subnet.cidr
      az   = subnet.az
      name = subnet.name
    }
  }
}