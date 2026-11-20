resource "aws_subnet" "main" {
  vpc_id     = var.vpc_id
  cidr_block = "${var.base_cidr}/${var.cidr_suffix}"

  tags = {
    Name = var.sn_name
  }
}
