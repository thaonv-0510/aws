// Public Subnet 1
resource "aws_subnet" "lab-architect-public-a" {
  vpc_id                  = aws_vpc.lab-architect-vpc.id
  cidr_block              = "10.0.0.0/20"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "lab-architect-public-a"
  }
}

// Public Subnet 1
resource "aws_subnet" "lab-architect-public-b" {
  vpc_id                  = aws_vpc.lab-architect-vpc.id
  cidr_block              = "10.0.16.0/20"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "lab-architect-public-b"
  }
}

# resource "aws_flow_log" "log-subnet-public-b" {
#   subnet_id    = aws_subnet.lab-architect-public-b.id
#   traffic_type = "ALL"
# }

// Private Subnet 1
resource "aws_subnet" "lab-architect-private-a" {
  vpc_id            = aws_vpc.lab-architect-vpc.id
  cidr_block        = "10.0.32.0/20"
  availability_zone = "us-east-1a"

  tags = {
    Name = "lab-architect-private-a"
  }
}

# resource "aws_flow_log" "log-subnet-private-a" {
#   subnet_id    = aws_subnet.lab-architect-private-a.id
#   traffic_type = "ALL"
# }

// Private Subnet 2
resource "aws_subnet" "lab-architect-private-b" {
  vpc_id            = aws_vpc.lab-architect-vpc.id
  cidr_block        = "10.0.48.0/20"
  availability_zone = "us-east-1b"

  tags = {
    Name = "lab-architect-private-b"
  }
}

# resource "aws_flow_log" "log-subnet-private-b" {
#   subnet_id    = aws_subnet.lab-architect-private-b.id
#   traffic_type = "ALL"
# }
// Flow log
resource "aws_flow_log" "lab-architect-vpc-flow-log" {
  vpc_id               = aws_vpc.lab-architect-vpc.id
  log_destination_type = "s3"
  log_destination      = aws_s3_bucket.lab-architect-bucket.arn
  traffic_type         = "ALL"
}

resource "aws_s3_bucket" "lab-architect-bucket" {
  bucket = "lab-architect-bucket"
  tags = {
    Name = "lab-architect-bucket"
  }
}
