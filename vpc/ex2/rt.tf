// Private Route Table
resource "aws_route_table" "lab-architect-route-private" {
  vpc_id = aws_vpc.lab-architect-vpc.id

  tags = {
    Name = "lab-architect-route-private"
  }
}

resource "aws_route_table_association" "route-association-private-a" {
  route_table_id = aws_route_table.lab-architect-route-private.id
  subnet_id      = aws_subnet.lab-architect-private-a.id
}

resource "aws_route_table_association" "route-association-private-b" {
  route_table_id = aws_route_table.lab-architect-route-private.id
  subnet_id      = aws_subnet.lab-architect-private-b.id
}

// Public Route Table

resource "aws_route_table" "lab-architect-route-public" {
  vpc_id = aws_vpc.lab-architect-vpc.id

  tags = {
    Name = "lab-architect-route-public"
  }
}

resource "aws_route_table_association" "route-association-public-a" {
  route_table_id = aws_route_table.lab-architect-route-public.id
  subnet_id      = aws_subnet.lab-architect-public-a.id
}

resource "aws_route_table_association" "route-association-public-b" {
  route_table_id = aws_route_table.lab-architect-route-public.id
  subnet_id      = aws_subnet.lab-architect-public-b.id
}

resource "aws_route" "route-public-a" {
  route_table_id         = aws_route_table.lab-architect-route-public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.lab-architect-gateway.id
}

resource "aws_route" "route-private-a" {
  route_table_id         = aws_route_table.lab-architect-route-private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.lab-architect-natgw.id
}
