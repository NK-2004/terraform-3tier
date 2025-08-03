provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source     = "./modules/vpc"
  vpc_cidr   = "10.0.0.0/16"
}

module "ec2" {
  source         = "./modules/ec2"
  subnet_id      = module.vpc.public_subnet_id
  security_group = module.vpc.web_sg
}

module "rds" {
  source        = "./modules/rds"
  username      = "admin"
  password      = "Admin12345"
  db_name       = "mydb"
  db_sg         = module.vpc.db_sg
  subnet_ids    = module.vpc.private_subnet_ids  # updated to pass 2 AZs
}

