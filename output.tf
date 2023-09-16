



output "rds_standby_endpoint" {
  description = "Endpoint of the RDS standby instance"
  value       = aws_db_instance.rds_standby.endpoint
}

output "rds_primary_username" {
  description = "Username for the RDS primary instance"
  value       = aws_db_instance.rds_primary.username
}

output "rds_standby_username" {
  description = "Username for the RDS standby instance"
  value       = aws_db_instance.rds_standby.username
}

output "rds_primary_db_name" {
  description = "Name of the RDS primary database"
  value       = aws_db_instance.rds_primary.db_name
}

output "rds_standby_db_name" {
  description = "Name of the RDS standby database"
  value       = aws_db_instance.rds_standby.db_name
}
output "rds_subnet_group_arn" {
  description = "ARN of the created RDS subnet group"
  value       = aws_db_subnet_group.rds_subnet_group.arn
}

output "private_eip_az1" {
  description = "Private EIP for Availability Zone 1"
  value       = aws_eip.private_eip_az1.public_ip
}

output "private_eip_az2" {
  description = "Private EIP for Availability Zone 2"
  value       = aws_eip.private_eip_az2.public_ip
}

output "public_eip_az1" {
  description = "Public EIP for Availability Zone 1"
  value       = aws_eip.public_eip_az1.public_ip
}
output "public_eip_az2" {
  description = "Public EIP for Availability Zone 2"
  value       = aws_eip.public_eip_az2.public_ip
}

output "private_instance_id" {
  description = "ID of the private instance"
  value       = aws_instance.private_instances[0].id
}

output "private_instance_public_ip" {
  description = "Public IP of the private instance"
  value       = aws_instance.private_instances[0].public_ip
}

output "private_instance_private_ip" {
  description = "Private IP of the private instance"
  value       = aws_instance.private_instances[0].private_ip
}

output "private_instance_security_groups" {
  description = "Security groups attached to the private instance"
  value       = aws_instance.private_instances[0].security_groups
}

output "private_instance_id_2" {
  description = "ID of the second private instance"
  value       = aws_instance.private_instances[1].id
}

output "private_instance_public_ip_2" {
  description = "Public IP of the second private instance"
  value       = aws_instance.private_instances[1].public_ip
}

output "private_instance_private_ip_2" {
  description = "Private IP of the second private instance"
  value       = aws_instance.private_instances[1].private_ip
}

output "private_instance_security_groups_2" {
  description = "Security groups attached to the second private instance"
  value       = aws_instance.private_instances[1].security_groups
}

output "public_instance_id_2" {
  description = "ID of the second public instance"
  value       = aws_instance.public_instances[1].id
}

output "public_instance_public_ip_2" {
  description = "Public IP of the second public instance"
  value       = aws_instance.public_instances[1].public_ip
}

output "public_instance_private_ip_2" {
  description = "Private IP of the second public instance"
  value       = aws_instance.public_instances[1].private_ip
}

output "public_instance_security_groups_2" {
  description = "Security groups attached to the second public instance"
  value       = aws_instance.public_instances[1].security_groups
}
#Certainly, here's the continuation of the `output.tf` file with outputs for the additional resources you provided:



output "private_elb_arn" {
  description = "ARN of the private Elastic Load Balancer"
  value       = aws_lb.private_elb.arn
}



output "public_alb_arn" {
  description = "ARN of the public Application Load Balancer"
  value       = aws_lb.public_alb.arn
}

output "public_alb_dns_name" {
  description = "DNS name of the public Application Load Balancer"
  value       = aws_lb.public_alb.dns_name
}

output "public_alb_listener_arn" {
  description = "ARN of the public ALB listener"
  value       = aws_lb_listener.public_alb_listener.arn
}

output "private_nat_gateway_az1_id" {
  description = "ID of the private NAT gateway in Availability Zone 1"
  value       = aws_nat_gateway.private_nat_gateway_az1.id
}

output "private_nat_gateway_az1_private_ip" {
  description = "Private IP of the private NAT gateway in Availability Zone 1"
  value       = aws_nat_gateway.private_nat_gateway_az1.private_ip
}

output "private_nat_gateway_az1_public_ip" {
  description = "Public IP of the private NAT gateway in Availability Zone 1"
  value       = aws_nat_gateway.private_nat_gateway_az1.public_ip
}


#These outputs provide information about the public launch configuration, private Elastic Load Balancer, public Application Load Balancer, ALB listener, and private NAT gateway. You can use these outputs to access these resources' important details for further configuration or reference.

#Certainly, here's the continuation of the `output.tf` file with outputs for the additional resources you provided:


output "private_nat_gateway_az2_id" {
  description = "ID of the private NAT gateway in Availability Zone 2"
  value       = aws_nat_gateway.private_nat_gateway_az2.id
}

output "private_nat_gateway_az2_private_ip" {
  description = "Private IP of the private NAT gateway in Availability Zone 2"
  value       = aws_nat_gateway.private_nat_gateway_az2.private_ip
}

output "private_nat_gateway_az2_public_ip" {
  description = "Public IP of the private NAT gateway in Availability Zone 2"
  value       = aws_nat_gateway.private_nat_gateway_az2.public_ip
}

output "public_nat_gateway_az1_id" {
  description = "ID of the public NAT gateway in Availability Zone 1"
  value       = aws_nat_gateway.public_nat_gateway_az1.id
}

output "public_nat_gateway_az1_private_ip" {
  description = "Private IP of the public NAT gateway in Availability Zone 1"
  value       = aws_nat_gateway.public_nat_gateway_az1.private_ip
}

output "public_nat_gateway_az1_public_ip" {
  description = "Public IP of the public NAT gateway in Availability Zone 1"
  value       = aws_nat_gateway.public_nat_gateway_az1.public_ip
}

output "public_nat_gateway_az2_id" {
  description = "ID of the public NAT gateway in Availability Zone 2"
  value       = aws_nat_gateway.public_nat_gateway_az2.id
}

output "public_nat_gateway_az2_private_ip" {
  description = "Private IP of the public NAT gateway in Availability Zone 2"
  value       = aws_nat_gateway.public_nat_gateway_az2.private_ip
}

output "public_nat_gateway_az2_public_ip" {
  description = "Public IP of the public NAT gateway in Availability Zone 2"
  value       = aws_nat_gateway.public_nat_gateway_az2.public_ip
}

output "allow_tls_sg_id" {
  description = "ID of the security group allowing TLS inbound traffic"
  value       = aws_security_group.allow_tls.id
}

output "private_elb_sg_id" {
  description = "ID of the security group for the private Elastic Load Balancer"
  value       = aws_security_group.private_elb_sg.id
}

output "public_alb_sg_id" {
  description = "ID of the security group for the public Application Load Balancer"
  value       = aws_security_group.public_alb_sg.id
}

output "rds_sg_id" {
  description = "ID of the security group for the RDS instance"
  value       = aws_security_group.rds_sg.id
}

output "private_subnet_az1_ec2_id" {
  description = "ID of the private subnet in Availability Zone 1 for EC2 instances"
  value       = aws_subnet.private_subnet_az1_ec2.id
}


output "private_subnet_az2_ec2_id" {
  description = "ID of the private subnet in Availability Zone 2 for EC2 instances"
  value       = aws_subnet.private_subnet_az2_ec2.id
}

output "public_subnet_az1_id" {
  description = "ID of the public subnet in Availability Zone 1"
  value       = aws_subnet.public_subnet_az1.id
}

output "public_subnet_az2_id" {
  description = "ID of the public subnet in Availability Zone 2"
  value       = aws_subnet.public_subnet_az2.id
}


output "vpc_id" {
  description = "ID of the main VPC"
  value       = aws_vpc.main.id
}
