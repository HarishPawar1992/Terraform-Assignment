#--------------------------------------------------------------------------#
#                               VPC Outputs                                #
#--------------------------------------------------------------------------#
output "vpc_id" {
  description = "The id of the VPC."
  value       = aws_vpc.vpc.id
}

output "ops_subnets" {
  description = "List of ops subnet"
  value       = aws_subnet.ops_subnets.*.id
}

output "ep_subnets" {
  description = "List of ep subnet"
  value       = aws_subnet.ep_subnets.*.id
}

output "ops_sg" {
  description = "Ops SG ID"
  value       = aws_security_group.ops_sg.id
}

output "ep_sg" {
  description = "EP SG ID"
  value       = aws_security_group.ep_sg.id
}

output "ops_nacl" {
  description = "Ops NACL ID"
  value = aws_network_acl.ops_nacl.id
}

output "ep_nacl" {
  description = "ep NACL ID"
  value = aws_network_acl.ep_nacl.id
}
