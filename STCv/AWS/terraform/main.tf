# Specifying the provider region
provider "aws" {
  region = var.aws_region
  version = "~> 2.0"
}


module "stcv1" {
  source = "./modules/aws-stcv-instance"
  ami = "ami-0793d10a6bb5738cf"
  instance_type = "c5.xlarge"
  availability_zone = "us-west-2b"
  key_name = "spirent-cip-aws"

  name = "STCv-VM1"

  subnet_id_mgmt = aws_subnet.stcv-mgmt-subnet.id

  subnet_id_test = aws_subnet.stcv-test-subnet.id

  security_groups_mgmt_interface = [aws_security_group.stcv-mgmt-sg.id]

  security_groups_test_interface = [aws_security_group.stcv-test-sg.id]
}

module "stcv2" {
  source = "./modules/aws-stcv-instance"
  ami = "ami-04a73d94656941274"
  instance_type = "c5.xlarge"
  availability_zone = "us-west-2b"
  key_name = "spirent-cip-aws"

  name = "STCv-VM2"

  subnet_id_mgmt = aws_subnet.stcv-mgmt-subnet.id

  subnet_id_test = aws_subnet.stcv-test-subnet.id

  security_groups_mgmt_interface = [aws_security_group.stcv-mgmt-sg.id]

  security_groups_test_interface = [aws_security_group.stcv-test-sg.id]
}
