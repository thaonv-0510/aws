resource "aws_security_group" "lab-architect-sg-web" {
  name = "lab-architect-sg-web"

  tags = {
    Name = "lab-architect-sg-web"
  }
}

resource "aws_security_group_rule" "sg-rule-https" {
  security_group_id = aws_security_group.lab-architect-sg-web.id
  type              = "ingress"
  from_port         = "443"
  to_port           = "443"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "sg-rule-http" {
  security_group_id = aws_security_group.lab-architect-sg-web.id
  type              = "ingress"
  from_port         = "80"
  to_port           = "80"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "sg-rule-ssh" {
  security_group_id = aws_security_group.lab-architect-sg-web.id
  type              = "ingress"
  from_port         = "22"
  to_port           = "22"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "sg-rule-outbound" {
  security_group_id = aws_security_group.lab-architect-sg-web.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}
