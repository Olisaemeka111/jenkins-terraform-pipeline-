resource "aws_lb" "private_elb" {
  name               = "private-elb"
  internal           = true
  load_balancer_type = "network"
  security_groups    = [aws_security_group.private_elb_sg.id]
  subnets            = [aws_subnet.private_subnet_az1_ec2.id, aws_subnet.private_subnet_az2_ec2.id]

  enable_deletion_protection = false
}

