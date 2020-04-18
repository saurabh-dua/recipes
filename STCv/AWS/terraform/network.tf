# Creating 2 subnets within the VPC
resource "aws_subnet" "stcv-mgmt-subnet" {
  vpc_id     = aws_vpc.stcv-vpc.id
  cidr_block = var.subnet_mgmt_cidr_ipv4
  availability_zone = var.availability_zone

  tags = {
    Name = "stcv-mgmt-subnet"
  }
}

resource "aws_subnet" "stcv-test-subnet" {
  vpc_id     = aws_vpc.stcv-vpc.id
  cidr_block = var.subnet_test_cidr_ipv4
  availability_zone = var.availability_zone

  tags = {
    Name = "stcv-test-subnet"
  }
}

# Creating an internet gateway
resource "aws_internet_gateway" "stcv-igw" {
  vpc_id = aws_vpc.stcv-vpc.id

  tags = {
    Name = "stcv-igw"
  }
}

# Creating a route table
resource "aws_default_route_table" "stcv-rtb" {
  default_route_table_id = aws_vpc.stcv-vpc.default_route_table_id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.stcv-igw.id
  }

  tags = {
      Name = "stcv-rtb"
  }
}

# Creating mgmt subnet route table mappings
resource "aws_route_table_association" "stcv-mgmt-subnet-association"{
  subnet_id = aws_subnet.stcv-mgmt-subnet.id
  route_table_id = aws_default_route_table.stcv-rtb.id
}

# Creating test subnet route table mappings
resource "aws_route_table_association" "stcv-test-subnet-association"{
  subnet_id = aws_subnet.stcv-test-subnet.id
  route_table_id = aws_default_route_table.stcv-rtb.id
}
