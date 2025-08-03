output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_ids" {
  value = [
    aws_subnet.private_subnet_1.id,
    aws_subnet.private_subnet_2.id
  ]
}

output "web_sg" {
  value = aws_security_group.web_sg.id
}

output "db_sg" {
  value = aws_security_group.db_sg.id
}

output "db_subnet_group" {
  value = aws_db_subnet_group.db_subnet_group.name
}

