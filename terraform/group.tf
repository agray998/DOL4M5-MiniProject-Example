resource "aws_security_group" "ci" {
  name        = "ci-sg"
  description = "Allow SSH, HTTP and Jenkins traffic"
  vpc_id      = module.lab_vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.all_addresses]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.all_addresses]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.all_addresses]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.all_addresses]
  }

  tags = {
    Name = "CI SecGroup"
  }
}


resource "aws_security_group" "deploy" {
  name        = "deploy-sg"
  description = "Allow HTTP, SSH and API traffic"
  vpc_id      = module.lab_vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.all_addresses]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.all_addresses]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = [var.all_addresses]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.all_addresses]
  }

  tags = {
    Name = "Deploy SecGroup"
  }
}


