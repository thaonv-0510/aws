terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.32"
    }
  }
}

provider "aws" {
  region                   = "ap-northeast-1"
  shared_credentials_files = ["~/.aws/credentials"]
}

resource "aws_elb" "balancer-1" {
  name            = "balancer-example"
  instances       = [aws_instance.server-1.id, aws_instance.server-2.id]
  subnets         = [aws_subnet.subnet-public.id]
  security_groups = [aws_security_group.security-group-lb.id]

  listener {
    lb_protocol       = "http"
    lb_port           = "80"
    instance_protocol = "http"
    instance_port     = "80"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }
}

resource "aws_instance" "server-1" {
  ami             = "ami-07a48f4a2abe3a5fc"
  subnet_id       = aws_subnet.subnet-1.id
  security_groups = [aws_security_group.security-group-1.id]
  user_data       = file("command.tpl")
  key_name        = "key-1"

  instance_type = "t2.micro"
}

resource "aws_instance" "server-2" {
  ami             = "ami-07a48f4a2abe3a5fc"
  subnet_id       = aws_subnet.subnet-2.id
  security_groups = [aws_security_group.security-group-1.id]
  user_data       = file("command.tpl")
  key_name        = "key-1"

  instance_type = "t2.micro"
}

resource "aws_vpc" "vpc-1" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-1"
  }
}

resource "aws_internet_gateway" "ig-lb" {
  vpc_id = aws_vpc.vpc-1.id
}

resource "aws_security_group" "security-group-1" {
  name   = "security-group-1"
  vpc_id = aws_vpc.vpc-1.id
}

resource "aws_security_group" "security-group-lb" {
  name   = "security-group-lb"
  vpc_id = aws_vpc.vpc-1.id
}

resource "aws_security_group_rule" "rule-lb" {
  security_group_id = aws_security_group.security-group-lb.id
  cidr_blocks       = ["0.0.0.0/0"]

  from_port = "80"
  to_port   = "80"
  protocol  = "tcp"
  type      = "ingress"
}

resource "aws_security_group_rule" "rule-1" {
  security_group_id        = aws_security_group.security-group-1.id
  source_security_group_id = aws_security_group.security-group-lb.id

  from_port = "80"
  to_port   = "80"
  protocol  = "tcp"
  type      = "ingress"
}

resource "aws_security_group_rule" "rule-ssh" {
  security_group_id = aws_security_group.security-group-1.id

  from_port   = "22"
  to_port     = "22"
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  type        = "ingress"
}

resource "aws_subnet" "subnet-1" {
  vpc_id                  = aws_vpc.vpc-1.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-1"
  }
}

resource "aws_subnet" "subnet-2" {
  vpc_id                  = aws_vpc.vpc-1.id
  cidr_block              = "10.0.10.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-2"
  }
}

resource "aws_subnet" "subnet-public" {
  vpc_id                  = aws_vpc.vpc-1.id
  cidr_block              = "10.0.20.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-public"
  }
}
