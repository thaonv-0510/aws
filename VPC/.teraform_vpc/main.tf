terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.1.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "lab-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "My Lab VPC"
  }
}

resource "aws_subnet" "private" {
  vpc_id = aws_vpc.lab-vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.lab-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_internet_gateway" "my_ig_1" {
  vpc_id = aws_vpc.lab-vpc.id

  tags = {
    Name = "Internet Gateway"
  }
}

resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.lab-vpc.id

  route {
    cidr_block                 = "0.0.0.0/0"
    gateway_id                 = aws_internet_gateway.my_ig_1.id
  }

  tags = {
    Name = "Public subnet route table"
  }
}

resource "aws_route_table_association" "my_route_table" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.my_route_table.id
}
