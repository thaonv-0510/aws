resource "aws_instance" "web_app" {
  ami             = "ami-07c589821f2b353aa"
  subnet_id       = aws_subnet.subnet-public.id
  security_groups = [aws_security_group.sg-1.id]
  instance_type   = "t2.micro"
  key_name        = "personal"
  user_data       = file("command.tpl")
}

resource "aws_security_group" "sg-1" {
  name   = "web-app-1"
  vpc_id = aws_vpc.vpc-1.id
}

resource "aws_security_group_rule" "rule-ingress-icmp" {
  security_group_id = aws_security_group.sg-1.id
  cidr_blocks       = ["0.0.0.0/0"]

  protocol  = "icmp"
  from_port = 8
  to_port   = 0
  type      = "ingress"
}

resource "aws_security_group_rule" "rule-egress-icmp" {
  security_group_id = aws_security_group.sg-1.id
  cidr_blocks       = ["0.0.0.0/0"]

  protocol  = "icmp"
  from_port = 8
  to_port   = 0
  type      = "egress"
}

resource "aws_security_group_rule" "rule-ingress-ssh" {
  security_group_id = aws_security_group.sg-1.id
  cidr_blocks       = ["0.0.0.0/0"]

  protocol  = "tcp"
  from_port = 22
  to_port   = 22
  type      = "ingress"
}

resource "aws_security_group_rule" "rule-egress-ssh" {
  security_group_id = aws_security_group.sg-1.id
  cidr_blocks       = ["0.0.0.0/0"]

  protocol  = "tcp"
  from_port = 22
  to_port   = 22
  type      = "egress"
}

resource "aws_security_group_rule" "rule-ingress-http" {
  security_group_id = aws_security_group.sg-1.id
  cidr_blocks       = ["0.0.0.0/0"]

  protocol  = "tcp"
  from_port = 80
  to_port   = 80
  type      = "ingress"
}

resource "aws_security_group_rule" "rule-egress-http" {
  security_group_id = aws_security_group.sg-1.id
  cidr_blocks       = ["0.0.0.0/0"]

  protocol  = "tcp"
  from_port = 80
  to_port   = 80
  type      = "egress"
}


# resource "aws_ebs_volume" "web-app-volumn" {
#   availability_zone = aws_instance.web_app.availability_zone

#   size = 12
# }


# resource "aws_volume_attachment" "vol-1" {
#   device_name = "/dev/sdh"
#   instance_id = aws_instance.web_app.id
#   volume_id = aws_ebs_volume.web-app-volumn.id
# }

resource "aws_vpc" "vpc-1" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet-public" {
  cidr_block = "10.0.0.0/24"

  map_public_ip_on_launch = true

  vpc_id = aws_vpc.vpc-1.id
}

resource "aws_network_acl" "nacl-1" {
  vpc_id     = aws_vpc.vpc-1.id
  subnet_ids = [aws_subnet.subnet-public.id]
}

resource "aws_network_acl_rule" "rule-icmp-ingress" {
  network_acl_id = aws_network_acl.nacl-1.id
  rule_action    = "allow"
  rule_number    = 10
  protocol       = "icmp"
  from_port      = 8
  to_port        = 8
  icmp_type      = 8
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "rule-icmp-egress" {
  network_acl_id = aws_network_acl.nacl-1.id
  egress         = true
  rule_action    = "allow"
  rule_number    = 20
  protocol       = "icmp"
  from_port      = 0
  to_port        = 0
  icmp_type      = 0
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "rule-ssh-ingress" {
  network_acl_id = aws_network_acl.nacl-1.id
  rule_action    = "allow"
  rule_number    = 30
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "rule-ssh-egress" {
  network_acl_id = aws_network_acl.nacl-1.id
  egress         = true
  rule_action    = "allow"
  rule_number    = 40
  protocol       = "tcp"
  from_port      = "1024"
  to_port        = "65535"
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "rule-http-ingress" {
  network_acl_id = aws_network_acl.nacl-1.id
  rule_action    = "allow"
  rule_number    = 50
  protocol       = "all"
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "rule-http-egress" {
  network_acl_id = aws_network_acl.nacl-1.id
  egress         = true
  rule_action    = "allow"
  rule_number    = 60
  protocol       = "all"
  cidr_block     = "0.0.0.0/0"
}


resource "aws_network_acl_association" "nacl-ass-1" {
  network_acl_id = aws_network_acl.nacl-1.id
  subnet_id      = aws_subnet.subnet-public.id
}

resource "aws_internet_gateway" "ig-1" {
  vpc_id = aws_vpc.vpc-1.id
}

resource "aws_route_table" "rt-1" {
  vpc_id = aws_vpc.vpc-1.id
}

resource "aws_route" "route-1" {
  route_table_id         = aws_route_table.rt-1.id
  destination_cidr_block = "0.0.0.0/0"

  gateway_id = aws_internet_gateway.ig-1.id
}

resource "aws_route_table_association" "rt-ass" {
  subnet_id      = aws_subnet.subnet-public.id
  route_table_id = aws_route_table.rt-1.id
}
