## Webserver Target Group ##
resource "aws_lb_target_group" "cc_target_group_final" {
  health_check {
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  name        = "my-targetgroup-final"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id
}

## Webserver Target Group Attachment ##
resource "aws_lb_target_group_attachment" "cc_nlb_target_group_attachment" {
  count            = var.web_inst_count
  target_group_arn = aws_lb_target_group.cc_target_group_final.arn
  target_id        = element(var.inst_id, count.index)
  port             = 80
}

resource "aws_lb" "aws_nlb_final" {
  name               = "aws-nlb-final"
  internal           = false
  load_balancer_type = "network"

  subnets = [
    "${var.subnet1}",
    "${var.subnet2}",
  ]

  tags = {
    Name = "my-test-nlb"
  }

  ip_address_type = "ipv4"
}
