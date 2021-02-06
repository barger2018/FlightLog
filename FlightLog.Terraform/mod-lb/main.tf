resource "aws_security_group" "allow-all" {
  name        = "allow-all"
  description = "Allow all traffic"
  vpc_id      = var.vpc-id

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