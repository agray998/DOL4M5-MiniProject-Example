resource "aws_vpc" "main" {
  cidr_block = "${var.base_cidr}/16"
  tags = {
    Name = var.vpc_name
  }
}

