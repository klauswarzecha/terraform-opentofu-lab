resource "aws_security_group" "this" {
  name        = var.name
  description = "Basic lab security group."
  vpc_id      = var.vpc_id

  tags = {
    Name = var.name
  }
}