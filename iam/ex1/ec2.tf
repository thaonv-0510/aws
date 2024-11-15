resource "aws_default_subnet" "subnet-role-1" {
  availability_zone = "ap-northeast-1a"
}

resource "aws_instance" "instance-role" {
  ami           = "ami-07c589821f2b353aa"
  instance_type = "t2.micro"
  key_name      = "persional"
  user_data     = file("command.tpl")
  subnet_id     = aws_default_subnet.subnet-role-1.id
  security_groups = [ aws_security_group.sg-role-1.id ]
  iam_instance_profile = aws_iam_instance_profile.instance-profile-1.name
}

resource "aws_security_group" "sg-role-1" {
  vpc_id = aws_default_subnet.subnet-role-1.vpc_id
}

resource "aws_security_group_rule" "rule-ssh" {
  from_port         = "22"
  to_port           = "22"
  protocol          = "tcp"
  type              = "ingress"
  security_group_id = aws_security_group.sg-role-1.id
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "rule-https-ingress" {
  from_port         = "443"
  to_port           = "443"
  protocol          = "tcp"
  type              = "ingress"
  security_group_id = aws_security_group.sg-role-1.id
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "rule-https-out" {
  from_port         = "443"
  to_port           = "443"
  protocol          = "tcp"
  type              = "egress"
  security_group_id = aws_security_group.sg-role-1.id
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "rule-http-out" {
  from_port         = "80"
  to_port           = "80"
  protocol          = "tcp"
  type              = "egress"
  security_group_id = aws_security_group.sg-role-1.id
  cidr_blocks = ["0.0.0.0/0"]
}
