output "ci_instance_ip" {
  value = module.ci_ec2.instance_ip
}

output "ci_private_key" {
  value     = module.ci_ec2.key
  sensitive = true
}


output "deploy_instance_ip" {
  value = module.deploy_ec2.instance_ip
}

output "deploy_private_key" {
  value     = module.deploy_ec2.key
  sensitive = true
}

resource "local_file" "ansible_inventory" {
  filename = "${path.root}/inventory.yaml"
  content  = <<EOF
  all:
    children:
      ci_servers:
        hosts:
          ${module.ci_ec2.instance_ip}:
            ansible_user: ubuntu
            ansible_ssh_private_key_file: ${path.root}/ci_key.pem
      deploy_servers:
        hosts:
          ${module.deploy_ec2.instance_ip}:
            ansible_user: ubuntu
            ansible_ssh_private_key_file: ${path.root}/deploy_key.pem
  EOF
}


