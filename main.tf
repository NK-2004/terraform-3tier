module "vpc" {
  source          = "./modules/vpc"
  vpc_cidr        = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
  azs             = ["us-east-1a", "us-east-1b"]
}

resource "aws_security_group" "web_sg" {
  name   = "web-sg"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "web_ec2" {
  source            = "./modules/ec2"
  ami_id            = "ami-0c55b159cbfafe1f0" # Change for your region
  instance_type     = "t2.micro"
  subnet_id         = module.vpc.public_subnet_ids[0]
  security_group_id = aws_security_group.web_sg.id
  public_ip         = true
  user_data         = "${path.module}/scripts/user_data.sh"
  key_name          = "your-key"
  name              = "WebEC2"
}

module "rds" {
  source            = "./modules/rds"
  private_subnet_ids = module.vpc.private_subnet_ids
  db_name           = "mydb"
  db_user           = "admin"
  db_pass           = "password123"
  db_sg_id          = aws_security_group.web_sg.id
}

