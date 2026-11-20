#!/bin/bash

export WDIR=$(pwd)

cd $WDIR/terraform
terraform plan -out plan.tfplan
terraform apply plan.tfplan

cp inventory.yaml *.pem $WDIR/ansible/

cd $WDIR/ansible
ansible-playbook -i inventory.yaml playbook.yaml

cd $WDIR
