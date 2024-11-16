resource "aws_default_subnet" "subnet-1" {
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true
}

resource "aws_instance" "ec2-1" {
  ami             = "ami-07c589821f2b353aa"
  key_name        = "persional"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.lab-architect-sg-web.id]
  user_data       = file("command.tpl")
  subnet_id       = aws_default_subnet.subnet-1.id
}

resource "aws_default_route_table" "default-route-1" {
  default_route_table_id = "rtb-035439b874222b160"
}

resource "aws_route" "route-1" {
  route_table_id         = aws_default_route_table.default-route-1.id
  gateway_id             = data.aws_internet_gateway.igw-1.id
  destination_cidr_block = "0.0.0.0/0"
}
