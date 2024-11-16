resource "aws_network_acl" "lab-architect-acl-public" {
  vpc_id     = aws_vpc.lab-architect-vpc.id
  subnet_ids = [aws_subnet.lab-architect-public-a.id, aws_subnet.lab-architect-public-b.id]

  tags = {
    Name = "lab-architect-acl-public"
  }
}

resource "aws_network_acl" "lab-architect-acl-private" {
  vpc_id     = aws_vpc.lab-architect-vpc.id
  subnet_ids = [aws_subnet.lab-architect-private-a.id, aws_subnet.lab-architect-private-b.id]

  tags = {
    Name = "lab-architect-acl-private"
  }
}
