resource "aws_lb_target_group" "group-1" {
  name     = "target-group-1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_default_vpc.default.id
}

resource "aws_lb_target_group_attachment" "tg-att-1a" {
  target_id        = aws_instance.server-1a.id
  target_group_arn = aws_lb_target_group.group-1.arn
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg-att-1c" {
  target_id        = aws_instance.server-1c.id
  target_group_arn = aws_lb_target_group.group-1.arn
  port             = 80
}
