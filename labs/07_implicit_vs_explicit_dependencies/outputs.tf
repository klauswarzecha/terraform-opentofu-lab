output "vpc_id" {
  description = "ID of the VPC."
  value       = aws_vpc.lab.id
}

output "aws_internet_gateway_id" {
  description = "ID of the internet gateway."
  value       = aws_internet_gateway.lab.id
}

output "route_table_id" {
  description = "ID of the public route table."
  value       = aws_route_table.public.id
}

output "subnet_id" {
  description = "ID of the public subnet."
  value       = aws_subnet.public.id

}