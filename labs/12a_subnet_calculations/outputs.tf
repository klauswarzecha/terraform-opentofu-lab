output "subnet_cidrs" {
  description = "Calculated subnet CIDR blocks."
  value       = local.subnet_cidrs
}

output "subnets" {
  description = "Structured subnet definitions."
  value       = local.subnets
}

output "subnet_ids_mock" {
  description = "Mocked subnet objects showing how a later module output could look."
  value       = local.subnet_ids_mock
}