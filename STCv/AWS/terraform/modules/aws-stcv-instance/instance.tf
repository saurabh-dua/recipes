resource "aws_instance" "stcv" {
  ami           = var.ami
  instance_type = var.instance_type
  availability_zone = var.availability_zone
  key_name = var.key_name

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.nic-mgmt.id
    delete_on_termination = false
  }

  network_interface {
    device_index         = 1
    network_interface_id = aws_network_interface.nic-test.id
    delete_on_termination = false
  }

  tags = {
    Name = var.name
  }
}

resource "aws_network_interface" "nic-mgmt" {
  subnet_id       = var.subnet_id_mgmt
  description = "This is network interface for mgmt"
  security_groups = var.security_groups_mgmt_interface
}

resource "aws_network_interface" "nic-test" {
  subnet_id   = var.subnet_id_test
  description = "This is network interface for test"
  security_groups = var.security_groups_test_interface
}

resource "aws_eip" "mgmt-nic-ip" {
  network_interface = aws_network_interface.nic-mgmt.id
  depends_on = [aws_instance.stcv]
}
