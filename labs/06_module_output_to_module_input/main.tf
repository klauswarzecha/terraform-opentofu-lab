module "network" {
  source              = "../../modules/network_light"
  name_prefix         = "lab-06"
  vpc_cidr            = "10.60.0.0/16"
  public_subnet_cidrs = ["10.60.1.0/24", "10.60.2.0/24"]
}

module "basic_security_group" {
  source = "../../modules/security_group_basic"

  name   = "lab-06-basic-sg"
  vpc_id = module.network.vpc_id
}

