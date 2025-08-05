resource "aws_instance" "ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  associate_public_ip_address = var.public_ip
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name

  user_data = file(var.user_data)

  tags = { Name = var.name }
}

