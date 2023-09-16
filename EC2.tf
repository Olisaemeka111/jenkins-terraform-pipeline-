

resource "aws_instance" "public_instances" {
  count         = 2
  ami           = data.aws_ami.amzlinux2.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet_az1.id  # Use the appropriate subnet ID
  #key_name      = var.key_pair_name  # Replace with your key pair name

  tags = {
    Name = "public-instance-${count.index}"
  }
}

resource "aws_instance" "private_instances" {
  count         = 2
  ami           = data.aws_ami.amzlinux2.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet_az1_ec2.id  # Use the appropriate subnet ID
  #key_name      = var.key_pair_name  # Replace with your key pair name

  tags = {
    Name = "private-instance-${count.index}"
  }
}

data "aws_ami" "amzlinux2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}
