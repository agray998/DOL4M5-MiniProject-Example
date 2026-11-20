resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = var.rtb_id
}
