




# Create a security group to allow access from private subnets only. This is used by the EC2 instances that will run your application code


# ... Other resource definitions ...

# ... Other resource definitions ...

resource "aws_eip" "public_eip_az1" {
  domain = "vpc"
}

resource "aws_eip" "public_eip_az2" {
  domain = "vpc"
}

resource "aws_eip" "private_eip_az1" {
  domain = "vpc"
}

resource "aws_eip" "private_eip_az2" {
  domain = "vpc"
}

# ... Continue with other resource definitions ...

