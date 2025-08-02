resource "aws_db_instance" "mysql" {
  allocated_storage    = 20
  engine               = "mysql"
  instance_class       = "db.t2.micro"
  db_name              = var.db_name
  username             = var.username
  password             = var.password
  vpc_security_group_ids = [var.db_sg]
  db_subnet_group_name   = var.subnet_group
  skip_final_snapshot    = true
}

