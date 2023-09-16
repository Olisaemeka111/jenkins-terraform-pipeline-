#Continuing from the previous Terraform script, here's how you can add the creation of NAT Gateways in both public and private subnets to enable outbound internet access for instances in private subnets:





resource "aws_nat_gateway" "public_nat_gateway_az1" {
  allocation_id = aws_eip.public_eip_az1.id
  subnet_id     = aws_subnet.public_subnet_az1.id
}


resource "aws_nat_gateway" "public_nat_gateway_az2" {
  allocation_id = aws_eip.public_eip_az2.id
  subnet_id     = aws_subnet.public_subnet_az2.id
}



resource "aws_nat_gateway" "private_nat_gateway_az1" {
  allocation_id = aws_eip.private_eip_az1.id
  subnet_id     = aws_subnet.private_subnet_az1_ec2.id
}

resource "aws_nat_gateway" "private_nat_gateway_az2" {
  allocation_id = aws_eip.private_eip_az2.id
  subnet_id     = aws_subnet.private_subnet_az2_ec2.id
}


#In this script:

#- Two NAT Gateways are created, one in each Availability Zone.
#- Elastic IP addresses (EIPs) are associated with the NAT Gateways to provide a static public IP.
#- The NAT Gateways are associated with the public and private subnets in each AZ.

#Remember that using NAT Gateways for outbound internet access in private subnets is a common practice to allow private instances to access resources on the internet. Be sure to adjust settings such as EIP allocation and association based on your specific requirements.

#As always, these examples are simplified and may need additional configuration and customization to meet your specific needs and architecture.