provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./vpc_module"
}

module "ec2" {
  source      = "./ec2_module"
  vpc_id      = module.vpc.vpc_id
  subnet_id   = module.vpc.subnet_a.id
}

module "alb" {
  source            = "./alb_module"
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = [module.vpc.subnet_a.id, module.vpc.subnet_b.id]
  security_group_id = module.ec2.security_group.id
  ec2_instance_id   = module.ec2.web_server.id
}

module "rds" {
  source               = "./rds_module"
  vpc_id               = module.vpc.vpc_id
  security_group_id    = module.ec2.security_group.id
  db_subnet_group      = module.vpc.db_subnet_group.id
}
