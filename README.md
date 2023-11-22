#vpc module
"The VPC module generates an Application Load Balancer (ALB) within the public subnet, equipped with a security group permitting TLS traffic on port 443. Additionally, an S3 bucket is established to capture access logs for the ALB. The module's variables provide specifications for creating the Virtual Private Cloud (VPC), including the VPC name (name), CIDR block (cidr_block), instance tenancy (instance_tenancy), an optional IPv4 IPAM pool ID (ipv4_ipam_pool_id), and an optional netmask length for the IPv4 CIDR (ipv4_netmask_length)."

#to apply these changes
run #terraform init
#terraform plan 
#terraform apply
#terraform show
