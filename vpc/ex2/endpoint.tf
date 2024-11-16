resource "aws_vpc_endpoint" "lab-architect-vpc-endpoint" {
  vpc_id          = aws_vpc.lab-architect-vpc.id
  service_name    = "com.amazonaws.us-east-1.s3"
  route_table_ids = [aws_route_table.lab-architect-route-public.id, aws_route_table.lab-architect-route-private.id]
}

resource "aws_vpc_endpoint_policy" "lab-architect-endpoint-policy" {
  vpc_endpoint_id = aws_vpc_endpoint.lab-architect-vpc-endpoint.id
}
