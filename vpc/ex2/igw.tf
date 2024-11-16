resource "aws_internet_gateway" "lab-architect-gateway" {
  vpc_id = aws_vpc.lab-architect-vpc.id

  tags = {
    Name = "lab-architect-gateway"
  }
}