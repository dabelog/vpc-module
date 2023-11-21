output "id" {
  description = " ID of the VPC"
  value       = try(aws_vpc.this[0].id, "")
}

output "owner_id" {
  description = "The ID of the AWS account that owns the VPC"
  value       = try(aws_vpc.this[0].owner_id, "")
}

output "arn" {
  description = "Amazon Resource Name (ARN) of VPC"
  value       = try(aws_vpc.this[0].arn, "")
}

output "main_route_table_id" {
  description = "The ID of the main route table associated with this VPC. "
  value       = try(aws_vpc.this[0].main_route_table_id, "")
}

output "default_network_acl_id" {
  description = "The ID of the network ACL created by default on VPC creation"
  value       = try(aws_vpc.this[0].default_network_acl_id, "")
}

output "default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value       = try(aws_vpc.this[0].default_security_group_id, "")
}

output "default_route_table_id" {
  description = "The ID of the route table created by default on VPC creation"
  value       = try(aws_vpc.this[0].default_route_table_id, "")
}

### Folwlogs 

output "log_group_arn" {
  description = "Amazon Resource Name (ARN) specifying the log group."
  value       = var.log_destination == "" ? aws_cloudwatch_log_group.this[0].arn : var.log_destination
}
output "flow_log_id" {
  description = "The Flow Log ID"
  value       = var.enable_flow_logs ? try(aws_flow_log.this[0].id, "") : null
}

### Internete Gateway

output "igw_id" {
  description = "The ID of the Internet Gateway."
  value       = try(aws_internet_gateway.this[0].id, "")
}

output "igw_arn" {
  description = "The ID of the Internet Gateway."
  value       = try(aws_internet_gateway.this[0].arn, "")
}
