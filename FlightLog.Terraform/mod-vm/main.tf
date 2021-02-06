# resource "aws_vpc" "vpc" {
#   cidr_block = "10.0.0.0/16"
#   enable_dns_hostnames = true
# }

# resource "aws_internet_gateway" "gw" {
#   vpc_id = aws_vpc.vpc.id
# }

# resource "aws_subnet" "snet" {
#   vpc_id            = aws_vpc.vpc.id
#   cidr_block        = "10.0.1.0/24"
#   availability_zone = "us-east-1a"

#   map_public_ip_on_launch = true
#   depends_on = [aws_internet_gateway.gw]
# }

# resource "aws_network_interface" "nic" {
#   subnet_id   = aws_subnet.snet.id
#   private_ips = ["10.0.1.100"]
# }

resource "aws_key_pair" "aws" {
  key_name   = "aws"
  public_key = file("key.pub")
}

resource "aws_security_group" "allow-all" {
  name        = "allow-all-2"
  description = "Allow all traffic"
  #vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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
  key_name      = aws_key_pair.aws.key_name

  private_ip = "10.0.1.99"
  subnet_id = aws_subnet.snet.id
  security_groups = [ aws_security_group.allow-all.id ]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("key")
    host        = self.public_ip
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}

resource "aws_eip" "aws" {
  vpc      = true
  instance = aws_instance.vm.id
}