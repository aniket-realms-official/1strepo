


##############################
## TAREGT GROUP - INSTANCE ##
##############################

resource "aws_lb_target_group" "public_lb" {
  name     = "public-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
  // by default target_type = instances, other types are:
  // target_type = "ip"
  // target_type = "lambda"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/24"
}

resource "aws_lb" "CoreCard_InternetFacing_LB" {
  name               = "corecard-lb-tf"
  internal           = false
  load_balancer_type = "application"                          // load balancer type : application/network
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = aws_subnet.public.*.id

  enable_deletion_protection = false

  # access_logs {
  #   bucket  = aws_s3_bucket.lb_logs.bucket
  #   prefix  = "test-lb"
  #   enabled = true
  # }

  tags = {
    Environment = "production"
  }
}

resource "aws_alb_listener" "front_end" {
  load_balancer_arn   = aws_lb.CoreCard_InternetFacing_LB.arn
  port                = 80
  protocol            = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.public_lb.arn
  }
}
