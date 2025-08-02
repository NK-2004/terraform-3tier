resource "aws_instance" "web" {
  ami           = "ami-0a0f1259dd1c90938" # Amazon Linux 2023
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group]

  user_data = file("${path.module}/../../scripts/user_data.sh")

  tags = {
    Name = "WebServer"
  }
}
