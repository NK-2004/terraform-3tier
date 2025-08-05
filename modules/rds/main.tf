resource "aws_db_subnet_group" "default" {
  name       = "rds-subnet-group"
  subnet_ids = var.private_subnet_ids
}

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  name                 = var.db_name
  username             = var.db_user
  password             = var.db_pass
  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = [var.db_sg_id]
  skip_final_snapshot  = true
}

