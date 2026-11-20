# DOL4M5 Mini Project Example

Example Terraform/Ansible configs for DOL4M5 Mini Project.

## Goal
- VPC with 2x public subnets, each with 400+ available IP addresses
- 1x CI Server EC2 with ports open for HTTP, Jenkins and SSH
- 1x Deployment EC2 with public HTTP, port 5000 and SSH
- CI Server should have Docker, Jenkins, unzip, wget and curl installed
- CI Server needs to add Jenkins to sudo group and add user to Docker group 
- Deployment EC2 should run the app at this repo: https://gitlab.com/Reece-Elder/devops-m5-nodeproject/-/tree/main


