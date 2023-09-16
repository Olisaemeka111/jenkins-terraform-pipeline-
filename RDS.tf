resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.private_subnet_az1_ec2.id, aws_subnet.private_subnet_az2_ec2.id]
}

resource "aws_db_instance" "rds_primary" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  name                 = "rds-primary"  # Add the instance name
  username             = "dbuser"
  password             = "dbpassword"
  parameter_group_name = "default.mysql8.0"

  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  skip_final_snapshot = true  # Set this to true to avoid the error

  tags = {
    Name = "RDS Primary Instance"
  }
}

resource "aws_db_instance" "rds_standby" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  name                 = "rds-standby"  # Add the instance name
  username             = "dbuser"
  password             = "dbpassword"
  parameter_group_name = "default.mysql8.0"

  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  replication_source_identifier = aws_db_instance.rds_primary.id
  copy_tags_to_snapshot        = true

  tags = {
    Name = "RDS Standby Instance"
  }
}

# Define other necessary RDS-related resources like parameter groups, option groups, etc.

# Create a security group for RDS instances
resource "aws_security_group" "rds_sg" {
  name_prefix = "rds-sg-"
}

# Create a security group for EC2 instances
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-security-group"
  description = "Security group for EC2 instances"
  vpc_id      = aws_vpc.main.id
}
