resource "aws_lb" "balancer-1" {
  name               = "balancer-example"
  load_balancer_type = "application"
  subnets            = [aws_subnet.subnet-1a.id, aws_subnet.subnet-1c.id]
  security_groups    = [aws_security_group.sg-lb.id]
}

resource "aws_alb_listener" "lb-listener-1" {
  load_balancer_arn = aws_lb.balancer-1.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.group-1.id
  }
}
