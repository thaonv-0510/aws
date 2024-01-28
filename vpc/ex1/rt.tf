resource "aws_internet_gateway" "lab-architect-gateway" {
  vpc_id = aws_vpc.lab-architect-vpc.id

  tags = {
    Name = "lab-architect-gateway"
  }
}

resource "aws_route_table" "lab-architect-route-public" {
  vpc_id = aws_vpc.lab-architect-vpc.id

  tags = {
    Name = "lab-architect-route-public"
  }
}

resource "aws_route_table_association" "lab-architect-route-public-1a" {
  route_table_id = aws_route_table.lab-architect-route-public.id
  subnet_id = aws_subnet.lab-architect-public-a.id
}

resource "aws_route_table_association" "lab-architect-route-public-1c" {
  route_table_id = aws_route_table.lab-architect-route-public.id
  subnet_id = aws_subnet.lab-architect-public-b.id
}

resource "aws_route" "lab-architect-route" {
  route_table_id = aws_route_table.lab-architect-route-public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.lab-architect-gateway.id
}
