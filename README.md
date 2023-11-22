# vpc-module
that creates an alb in the public subnet with a security group attached to allow tls (port 443)
An alb log bucket was also created to store alb access logs.
The variables define properties to create the VPC, the VPC name (name), the CIDR block (cidr_block), instance tenancy (instance_tenancy), an optional IPv4 IPAM pool ID (ipv4_ipam_pool_id), and an optional netmask length for the IPv4 CIDR (ipv4_netmask_length).
