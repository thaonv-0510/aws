resource "aws_subnet" "lab-architect-public-a" {
  vpc_id = aws_vpc.lab-architect-vpc.id
  cidr_block = "10.0.16.0/20"
  availability_zone = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "lab-architect-public-a"
  }
}

resource "aws_subnet" "lab-architect-public-b" {
  vpc_id = aws_vpc.lab-architect-vpc.id
  cidr_block = "10.0.32.0/20"
  availability_zone = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "lab-architect-public-b"
  }
}
