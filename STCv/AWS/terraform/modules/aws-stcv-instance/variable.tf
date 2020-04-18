variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
}

variable "key_name" {
  description = "The key name to use for the instance"
  type        = string
  default     = ""
}

variable "name" {
  description = "Name to be used on all resources as prefix"
  type        = string
}

variable "availability_zone" {
  description = "Name to be used on all resources as prefix"
  type        = string
}

variable "security_groups_mgmt_interface" {
  description = "Security groups for the management interface and public IP"
  type        = list(string)
  default     = []
}

variable "security_groups_test_interface" {
  description = "Security groups for the test interfaces and private IPs"
  type        = list(string)
  default     = []
}

variable "subnet_id_mgmt" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = ""
}

variable "subnet_id_test" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = ""
}
