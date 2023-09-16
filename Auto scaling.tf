resource "aws_launch_template" "example_lt" {
  name_prefix   = "example-lt"
  instance_type = "t2.micro"
  image_id      = "ami-06e4b9a8856d164d9"
}

resource "aws_autoscaling_group" "example_asg_1" {
  name                 = "Public-subnet-asg-1"
  launch_template {
    id = aws_launch_template.example_lt.id
    version = "$Latest"
  }
  min_size             = 2
  max_size             = 4
  desired_capacity     = 2
  health_check_type   = "ELB"
  vpc_zone_identifier = [aws_subnet.public_subnet_az1.id, aws_subnet.public_subnet_az2.id]
}

resource "aws_autoscaling_group" "example_asg_2" {
  name                 = "Private-subnet-asg-2"
  launch_template {
    id = aws_launch_template.example_lt.id
    version = "$Latest"
  }
  min_size             = 2
  max_size             = 4
  desired_capacity     = 2
  health_check_type   = "ELB"
  vpc_zone_identifier = [aws_subnet.private_subnet_az1_ec2.id, aws_subnet.private_subnet_az2_ec2.id]
}
