module "network" {
  source              = "../../modules/network_light"
  name_prefix         = "${var.project_name}-dev"
  vpc_cidr            = "10.10.0.0/16"
  public_subnet_cidrs = ["10.10.1.0/24", "10.10.2.0/24"]
  tags                = var.tags
}