resource "aws_ec2_instance_connect_endpoint" "ice-1" {
  subnet_id          = aws_default_subnet.default-subnet-1.id
  security_group_ids = [aws_security_group.eic-sg-1.id]
}
