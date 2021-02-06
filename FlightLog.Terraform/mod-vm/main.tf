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