resource "aws_instance" "server-1a" {
  ami               = "ami-07c589821f2b353aa"
  subnet_id         = aws_subnet.subnet-1a.id
  availability_zone = "ap-northeast-1a"
  security_groups   = [aws_security_group.sg-1a.id]
  instance_type     = "t2.micro"
  key_name          = "personal"
  user_data         = file("command.tpl")
}

resource "aws_instance" "server-1c" {
  ami               = "ami-07c589821f2b353aa"
  subnet_id         = aws_subnet.subnet-1c.id
  availability_zone = "ap-northeast-1c"
  security_groups   = [aws_security_group.sg-1c.id]
  instance_type     = "t2.micro"
  key_name          = "personal"
  user_data         = file("command.tpl")
}

resource "aws_default_route_table" "default" {
  default_route_table_id = "rtb-035439b874222b160"
}

resource "aws_route_table_association" "rt-ass-1a" {
  subnet_id      = aws_subnet.subnet-1a.id
  route_table_id = aws_default_route_table.default.id
}

resource "aws_route_table_association" "rt-ass-1c" {
  subnet_id      = aws_subnet.subnet-1c.id
  route_table_id = aws_default_route_table.default.id
}


data "aws_internet_gateway" "default" {
  filter {
    name   = "attachment.vpc-id"
    values = [aws_default_vpc.default.id]
  }
}

resource "aws_route" "route-ig-1" {
  route_table_id         = aws_default_route_table.default.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = data.aws_internet_gateway.default.id
}
