variable "aws_region" {
  description = "The AWS region to create things in."
  type = string
  default     = "us-west-2"
}

variable "instance_count" {
  default = "2"
}

variable "vpc_cidr_ipv4" {
  type = string
  default = "10.10.0.0/22"
}

variable "subnet_mgmt_cidr_ipv4" {
  type = string
  default = "10.10.0.0/24"
}

variable "subnet_test_cidr_ipv4" {
  type = string
  default = "10.10.1.0/24"
}

variable "availability_zone" {
  type = string
  default = "us-west-2b"
}

variable "ingress_cidr_block" {
  description = "CIDR block for test subnet"
  type = list(string)
  default = ["10.10.1.0/24"]
}

variable "public_ip_access_list" {
  description = "Add IPs that are allowed to access VM"
  type = list(string)
  default = ["136.56.165.133/32"]
}
