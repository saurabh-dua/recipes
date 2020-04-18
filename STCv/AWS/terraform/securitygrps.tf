# Secure the default security group by removing egress
resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.stcv-vpc.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }
}

# Security groups for managemnet nic interface
resource "aws_security_group" "stcv-mgmt-sg" {
  vpc_id = aws_vpc.stcv-vpc.id
  name = "stcv-mgmt-sg"
  description = "Security group for access into mgmt interface"

    # allow ingress of all ports
    ingress {
      cidr_blocks = var.public_ip_access_list
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
    }

    # allow egress of all ports
    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "stcv-mgmt-sg"
      Description = "Security group for mgmt interface"
    }
}

# Security groups for test nic interface
resource "aws_security_group" "stcv-test-sg" {
  vpc_id = aws_vpc.stcv-vpc.id
  name = "stcv-test-sg"
  description = "Security group for test traffic"

    # allow ingress of all ports
    ingress {
      cidr_blocks = var.ingress_cidr_block
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
    }

    # allow egress of all ports
    egress {
      cidr_blocks = var.ingress_cidr_block
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
    }

    tags = {
      Name = "stcv-test-sg"
      Description = "Security group for test interface"
    }
}
