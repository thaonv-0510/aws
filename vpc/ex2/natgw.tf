resource "aws_nat_gateway" "lab-architect-natgw" {
  subnet_id = aws_subnet.lab-architect-public-a.id
  allocation_id = aws_eip.lab-architect-elastic-ip.id

  tags = {
    Name = "lab-architect-natgw"
  }
}