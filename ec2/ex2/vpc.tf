resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_default_subnet" "default-subnet-1" {
  availability_zone = "ap-northeast-1a"
}

resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_default_vpc.default.id
  cidr_block = "172.31.48.0/20"
}
