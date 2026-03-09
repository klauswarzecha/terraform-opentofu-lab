output "subnets" {
  value = {
    for key, subnet in aws_subnet.foreach_subnets :
    key => subnet.id
  }
}