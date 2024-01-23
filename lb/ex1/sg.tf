resource "aws_security_group" "sg-1a" {
  name   = "security-group-1"
  vpc_id = aws_default_vpc.default.id
}

resource "aws_security_group_rule" "rule-ingress-1a" {
  security_group_id = aws_security_group.sg-1a.id
  # source_security_group_id = aws_security_group.sg-lb.id
  cidr_blocks = ["0.0.0.0/0"]
  protocol    = "tcp"
  type        = "ingress"
  from_port   = 80
  to_port     = 80
}

resource "aws_security_group_rule" "rule-egress-1a" {
  security_group_id = aws_security_group.sg-1a.id
  # source_security_group_id = aws_security_group.sg-lb.id
  cidr_blocks = ["0.0.0.0/0"]
  protocol    = "tcp"
  type        = "egress"
  from_port   = 80
  to_port     = 80
}

resource "aws_security_group_rule" "rule-ingress-ssh-1a" {
  security_group_id = aws_security_group.sg-1a.id
  # source_security_group_id = aws_security_group.sg-lb.id
  cidr_blocks = ["0.0.0.0/0"]
  protocol    = "tcp"
  type        = "ingress"
  from_port   = 22
  to_port     = 22
}

resource "aws_security_group_rule" "rule-egress-ssh-1a" {
  security_group_id = aws_security_group.sg-1a.id
  # source_security_group_id = aws_security_group.sg-lb.id
  cidr_blocks = ["0.0.0.0/0"]
  protocol    = "tcp"
  type        = "egress"
  from_port   = 22
  to_port     = 22
}

resource "aws_security_group_rule" "rule-ingress-ssh-1c" {
  security_group_id = aws_security_group.sg-1c.id
  # source_security_group_id = aws_security_group.sg-lb.id
  cidr_blocks = ["0.0.0.0/0"]
  protocol    = "tcp"
  type        = "ingress"
  from_port   = 22
  to_port     = 22
}

resource "aws_security_group_rule" "rule-egress-ssh-1c" {
  security_group_id = aws_security_group.sg-1c.id
  # source_security_group_id = aws_security_group.sg-lb.id
  cidr_blocks = ["0.0.0.0/0"]
  protocol    = "tcp"
  type        = "egress"
  from_port   = 22
  to_port     = 22
}

resource "aws_security_group" "sg-1c" {
  name   = "security-group-2"
  vpc_id = aws_default_vpc.default.id
}

resource "aws_security_group_rule" "rule-ingress-1c" {
  security_group_id = aws_security_group.sg-1c.id
  # source_security_group_id = aws_security_group.sg-lb.id
  cidr_blocks = ["0.0.0.0/0"]
  protocol    = "tcp"
  type        = "ingress"
  from_port   = 80
  to_port     = 80
}

resource "aws_security_group_rule" "rule-egress-1c" {
  security_group_id = aws_security_group.sg-1c.id
  # source_security_group_id = aws_security_group.sg-lb.id
  cidr_blocks = ["0.0.0.0/0"]
  protocol    = "tcp"
  type        = "egress"
  from_port   = 80
  to_port     = 80
}


resource "aws_security_group" "sg-lb" {
  name   = "security-group-lb"
  vpc_id = aws_default_vpc.default.id
}

resource "aws_security_group_rule" "rule-ingress-lb" {
  security_group_id = aws_security_group.sg-lb.id
  cidr_blocks       = ["0.0.0.0/0"]
  protocol          = "tcp"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
}

resource "aws_security_group_rule" "rule-egress-lb" {
  security_group_id = aws_security_group.sg-lb.id
  cidr_blocks       = ["0.0.0.0/0"]
  protocol          = "tcp"
  type              = "egress"
  from_port         = 80
  to_port           = 80
}
