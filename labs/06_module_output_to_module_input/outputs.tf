output "vpc_id" {
  description = "ID of the VPC created by the network module."
  value       = module.network.vpc_id
}

output "security_group_id" {
  description = "ID of the security group created from the VPC output."
  value       = module.basic_security_group.security_group_id
}

