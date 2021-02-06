resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "snet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_network_interface" "nic" {
  subnet_id   = aws_subnet.snet.id
  private_ips = ["10.0.1.100"]
}

resource "aws_instance" "vm" {
  ami           = "ami-047a51fa27710816e" # us-east-1
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.nic.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}