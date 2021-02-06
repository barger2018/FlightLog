resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "snet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  map_public_ip_on_launch = true
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_network_interface" "nic" {
  subnet_id   = aws_subnet.snet.id
  private_ips = ["10.0.1.100"]
}

resource "aws_security_group" "allow-all" {
  name        = "allow-all"
  description = "Allow all traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "Never do this"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.main-cidr-group]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}

resource "aws_instance" "vm" {
  ami           = "ami-047a51fa27710816e" # us-east-1
  instance_type = "t2.micro"

  private_ip = "10.0.1.99"
  subnet_id = aws_subnet.snet.id

  credit_specification {
    cpu_credits = "unlimited"
  }
}