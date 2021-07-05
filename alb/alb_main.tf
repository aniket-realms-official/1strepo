# external webserver target group

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
  vpc_id      = "${var.vpc_id}"
}

resource "aws_lb_target_group_attachment" "cc_alb_target_group_attachment1" {
  target_group_arn = aws_lb_target_group.cc_target_group_final.arn
  target_id        = var.inst1_id
  port             = 80
}

resource "aws_lb_target_group_attachment" "cc_alb_target_group_attachment2" {
  target_group_arn = aws_lb_target_group.cc_target_group_final.arn
  target_id        = var.inst2_id
  port             = 80
}

resource "aws_lb" "aws_alb_final" {
  name     = "aws-alb-final"
  internal = false

  security_groups = ["${aws_security_group.alb_sg_final.id}",]

  subnets = [
    "${var.subnet1}",
    "${var.subnet2}",
  ]

  tags = {
    Name = "my-test-alb"
  }

  ip_address_type    = "ipv4"
  load_balancer_type = "application"
}

resource "aws_security_group" "alb_sg_final" {
  name   = "cc-alb-sg-final"
  vpc_id = "${var.vpc_id}"
}

resource "aws_security_group_rule" "inbound_rdp" {
  from_port         = 3389
  protocol          = "tcp"
  security_group_id = aws_security_group.alb_sg_final.id
  to_port           = 3389
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "inbound_http" {
  from_port         = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.alb_sg_final.id
  to_port           = 80
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "inbound_https" {
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.alb_sg_final.id
  to_port           = 443
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "outbound_all" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.alb_sg_final.id
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_lb_listener" "my-test-alb-listner" {
  load_balancer_arn = aws_lb.aws_alb_final.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.cc_target_group_final.arn
  }
}
