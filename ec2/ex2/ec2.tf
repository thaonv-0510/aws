resource "aws_instance" "server-1" {
  ami             = "ami-07c589821f2b353aa"
  key_name        = "key-1"
  subnet_id       = aws_subnet.private-subnet.id
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.ec2-sg-1.id]

  tags = {
    Name = "ec2-server"
  }
}
