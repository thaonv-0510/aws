resource "aws_network_acl" "lab-architect-acl-public" {
  vpc_id = aws_vpc.lab-architect-vpc.id
  subnet_ids = [ aws_subnet.lab-architect-public-a.id, aws_subnet.lab-architect-public-b.id ]
}
