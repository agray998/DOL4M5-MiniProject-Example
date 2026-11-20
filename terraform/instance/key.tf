resource "tls_private_key" "pk" {
  algorithm = "ED25519"
}


resource "aws_key_pair" "main" {
  key_name   = var.key_name
  public_key = tls_private_key.pk.public_key_openssh
}
