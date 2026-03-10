output "selected_azs" {
  description = "Availability zones selected for the lab."
  value       = local.selected_azs
}

output "subnet_ids" {
  description = "Subnets created in the selected AZs."
  value = {
    for k, s in aws_subnet.example : k => s.id
  }
}
