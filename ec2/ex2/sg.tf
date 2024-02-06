resource "aws_security_group" "eic-sg-1" {
  vpc_id = aws_default_vpc.default.id
}

resource "aws_security_group_rule" "rule-eic-1" {
  security_group_id = aws_security_group.eic-sg-1.id
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
}

resource "aws_security_group_rule" "rule-eic-2" {
  security_group_id = aws_security_group.eic-sg-1.id
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "egress"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
}

resource "aws_security_group" "ec2-sg-1" {
  vpc_id = aws_default_vpc.default.id
}

resource "aws_security_group_rule" "rule-ec2-1" {
  security_group_id        = aws_security_group.ec2-sg-1.id
  source_security_group_id = aws_security_group.eic-sg-1.id
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 22
  to_port                  = 22
}
