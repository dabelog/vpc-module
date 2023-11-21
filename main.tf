resource "aws_vpc" "this" {
  count = var.create_vpc ? 1 : 0

  cidr_block                           = var.cidr_block
  instance_tenancy                     = var.instance_tenancy
  ipv4_ipam_pool_id                    = var.ipv4_ipam_pool_id
  ipv4_netmask_length                  = var.ipv4_netmask_length
  ipv6_cidr_block                      = var.ipv6_cidr_block
  ipv6_ipam_pool_id                    = var.ipv6_ipam_pool_id
  ipv6_netmask_length                  = var.ipv6_netmask_length
  ipv6_cidr_block_network_border_group = var.ipv6_cidr_block_network_border_group
  enable_dns_support                   = var.enable_dns_support
  enable_network_address_usage_metrics = var.enable_network_address_usage_metrics
  enable_dns_hostnames                 = var.enable_dns_hostnames

  enable_classiclink               = var.enable_classiclink
  enable_classiclink_dns_support   = var.enable_classiclink_dns_support
  assign_generated_ipv6_cidr_block = var.assign_generated_ipv6_cidr_block


  tags = var.tags
  lifecycle {
    create_before_destroy = true
  }
}

#### DHCP Options ####

resource "aws_vpc_dhcp_options" "this" {
  count = var.create_vpc ? 1 : 0

  domain_name          = var.domain_name
  domain_name_servers  = var.domain_name_servers
  ntp_servers          = var.ntp_servers
  netbios_name_servers = var.netbios_name_servers
  netbios_node_type    = var.netbios_node_type

  tags = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

### Ensure the default security group of every VPC restricts all traffic  and NACL

resource "aws_default_security_group" "this" {
  count = var.create_vpc ? 1 : 0

  vpc_id = aws_vpc.this[0].id
  tags   = var.tags
}

resource "aws_default_network_acl" "this" {
  default_network_acl_id = aws_vpc.this[0].default_network_acl_id

  tags = var.tags
}
