output "instance_ip" {
  value = aws_instance.main.public_ip
}

output "key" {
  value = tls_private_key.pk.private_key_pem
  sensitive = true
}

resource "local_sensitive_file" "keyfile" {
  filename = "${path.root}/{var.key_name}.pem"
  content = tls_private_key.pk.private_key_pem
  file_permission = "0600"
}
