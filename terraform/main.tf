module "lab_vpc" {
  source = "./vpc"
}

module "public_subnet_ci" {
  source      = "./public_subnet"
  vpc_id      = module.lab_vpc.vpc_id
  rtb_id      = module.lab_vpc.rtb_id
  sn_name     = "CI Subnet"
  base_cidr   = "10.0.0.0"
  cidr_suffix = "20"
}

module "public_subnet_deploy" {
  source      = "./public_subnet"
  vpc_id      = module.lab_vpc.vpc_id
  rtb_id      = module.lab_vpc.rtb_id
  sn_name     = "Deployment Subnet"
  base_cidr   = "10.0.128.0"
  cidr_suffix = "20"
}

module "ci_ec2" {
  role          = "ci_server"
  source        = "./instance"
  sn_id         = module.public_subnet_ci.sn_id
  sg_id         = aws_security_group.ci.id
  instance_name = "CI Server"
  key_name      = "ci_key"
}

module "deploy_ec2" {
  role          = "deploy_host"
  source        = "./instance"
  sn_id         = module.public_subnet_deploy.sn_id
  sg_id         = aws_security_group.deploy.id
  instance_name = "Deploy Server"
  key_name      = "deploy_key"
}
