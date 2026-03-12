variable "name" {
  description = "Name of the security group."
  type        = string

}

variable "vpc_id" {
  description = "ID of the VPC in which the security group (SG) is created."
}
