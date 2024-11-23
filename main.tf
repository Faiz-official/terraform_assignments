#Module VPC

module "vpc" {
  source                  = "./modules/vpc"
  r_private_subnet_cidr_1 = var.m_private_subnet_cidr_1
  r_private_subnet_cidr_2 = var.m_private_subnet_cidr_2
  r_vpc_cidr              = var.m_vpc_cidr
  r_public_subnet_cidr    = var.m_public_subnet_cidr
}

#Module EC2 INSTANCE

module "ec2" {
  source             = "./modules/ec2"
  r_public_subnet_id = module.vpc.public_subnet_id
  r_ami_id           = var.m_ami_id
  r_instance_type    = var.m_instance_type
  r_vpc_id           = module.vpc.vpc_id
}

#Module ELASTIC LOAD BALANCER
module "elb" {
  source             = "./modules/elb"
  r_public_subnet_id = module.vpc.public_subnet_id
  r_vpc_id           = module.vpc.vpc_id
  r_web_sg_id        = module.ec2.web_sg_id
}

#Module RELATINAL DATABSE SYSTEM
module "rds" {
  source                = "./modules/rds"
  r_db_instance_class   = var.m_db_instance_class
  r_db_password         = var.m_db_password
  r_db_username         = var.m_db_username
  r_private_subnet_id_1 = module.vpc.private_subnet_id_1
  r_private_subnet_id_2 = module.vpc.private_subnet_id_2
}
