resource "aws_instance" "main" {
  ami                         = "resolve:ssm:/aws/service/canonical/ubuntu/server/resolute/stable/current/amd64/hvm/ebs-gp3/ami-id"
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  key_name = aws_key_pair.main.key_name
  vpc_security_group_ids      = [var.sg_id]
  subnet_id                   = var.sn_id
  tags = {
    Name = var.instance_name
    Role = var.role
  }
}
