variable "lb_tg_arn" {

}

variable "lb_tg_name" {

}

variable "image_id" {

}

data "aws_lb_target_group" "group-1" {
  arn  = var.lb_tg_arn
  name = var.lb_tg_name
}

resource "aws_autoscaling_group" "asg-1" {
  min_size                  = 1
  max_size                  = 2
  health_check_grace_period = 30
  health_check_type         = "ELB"
  availability_zones        = ["ap-northeast-1a", "ap-northeast-1c"]
  desired_capacity          = 1
  default_instance_warmup   = 30

  launch_template {
    id      = aws_launch_template.template-1.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_attachment" "asg-att-1" {
  autoscaling_group_name = aws_autoscaling_group.asg-1.name
  lb_target_group_arn    = data.aws_lb_target_group.group-1.arn
}

resource "aws_autoscaling_policy" "policy-asg-1" {
  name                   = "policy-asg-1"
  autoscaling_group_name = aws_autoscaling_group.asg-1.name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"

    }

    target_value = 70
  }
}

resource "aws_launch_template" "template-1" {
  instance_type = "t2.micro"
  image_id      = var.image_id
  key_name      = "personal"
}
