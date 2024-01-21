resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_subnet" "subnet-1a" {
  vpc_id                  = aws_default_vpc.default.id
  availability_zone       = "ap-northeast-1a"
  cidr_block              = "172.31.48.0/24"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet-1c" {
  vpc_id                  = aws_default_vpc.default.id
  availability_zone       = "ap-northeast-1c"
  cidr_block              = "172.31.56.0/24"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet-public" {
  vpc_id                  = aws_default_vpc.default.id
  cidr_block              = "172.31.64.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-public"
  }
}
