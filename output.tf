output "web_instance_public_ip" {
  description = "The public IP of the web EC2 instance"
  value       = module.web_ec2.public_ip
}

output "web_instance_id" {
  description = "The ID of the web EC2 instance"
  value       = module.web_ec2.instance_id
}

output "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = module.rds.db_endpoint
}

