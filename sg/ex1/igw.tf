data "aws_internet_gateway" "igw-1" {
  filter {
    name   = "attachment.vpc-id"
    values = [aws_default_vpc.default-vpc.id]
  }
}
