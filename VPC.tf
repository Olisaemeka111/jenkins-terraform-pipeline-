#To create a VPC in the AWS US East 1 region and divide it into two Availability Zones (AZ1 and AZ2) using Terraform, you can use the following example:

resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-1b"

  tags = {
    Name = "public-subnet-az1"
  }
}

resource "aws_subnet" "public_subnet_az2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-1a"

  tags = {
    Name = "public-subnet-az2"
  }
}


resource "aws_subnet" "private_subnet_az1_ec2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-west-1b"

  tags = {
    Name = "private-subnet-zone1"
  }
}

resource "aws_subnet" "private_subnet_az2_ec2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "private-subnet-zone2"
  }
}

# Now you need to attach an Internet Gateway to your VPC
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}

resource "aws_security_group" "public_alb_sg" {
  name        = "public-alb-sg"
  description = "Security group for the public ALB"
  vpc_id      = aws_vpc.main.id  # Replace with the actual VPC ID

  # Define ingress and egress rules as needed
}



resource "aws_security_group" "load_balancer_sg" {
  name_prefix = "load-balancer-sg-"

  # Define your security group rules here
}





