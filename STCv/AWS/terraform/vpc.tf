# Creating a VPC
resource "aws_vpc" "stcv-vpc" {
  cidr_block = var.vpc_cidr_ipv4
  enable_dns_support = true
  enable_dns_hostnames = false
  assign_generated_ipv6_cidr_block = false
  instance_tenancy = "default"

  tags = {
    Name = "stcv-vpc"
  }
}
