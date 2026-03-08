output "subnets" {
  value = aws_subnet.count_subnets[*].id
}