resource "aws_launch_configuration" "cc-launch-config" {
  image_id        = "ami-067d3e2d50855f7d6"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.cc_autoscale_sg_final.id}"]

  user_data = <<-EOF
              <powershell>
              msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi
              Initialize-AWSDefaultConfiguration -Accesskey AKIATC4BRTUBE2UAY6G3 -Secretkey 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 -Region us-east-2
              Copy-S3Object -BucketName test-bucket-june-18-2021 -KeyPrefix Coreissue_Automation_Scripts -LocalFolder C:/
              & "C:/master.ps1"
              </powershell>
              <persist>false</persist>
              EOF

  lifecycle {
    create_before_destroy = true
  }
}

# Auto-scaling Group
resource "aws_autoscaling_group" "cc_autoscale_group_final" {
  launch_configuration = aws_launch_configuration.cc-launch-config.name
  vpc_zone_identifier  = ["${var.subnet1}","${var.subnet2 }"]
  target_group_arns    = ["${var.target_group_arn}"]
  health_check_type    = "ELB"

  min_size                  = 1
  max_size                  = 2

  tag {
    key                 = "Name"
    value               = "external-webserver"
    propagate_at_launch = true
  }
}

# auto-scaling security group
resource "aws_security_group" "cc_autoscale_sg_final" {
  name   = "cc-autoscale-sg"
  vpc_id = var.vpc_id
}

# Ingress HTTP rule
resource "aws_security_group_rule" "http_inbound_access" {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    type        = "ingress"
    security_group_id = aws_security_group.cc_autoscale_sg_final.id
  }

# Ingress HTTPS rule
  resource "aws_security_group_rule" "https_inbound_access" {
      description = "HTTPS"
      from_port   = 443
      to_port     = 443
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
      type        = "ingress"
      security_group_id = aws_security_group.cc_autoscale_sg_final.id
    }

# Ingress HTTPS rule
  resource "aws_security_group_rule" "rdp_inbound_access" {
      description = "RDP"
      from_port   = 3389
      to_port     = 3389
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
      type        = "ingress"
      security_group_id = aws_security_group.cc_autoscale_sg_final.id
    }

    # All OutBound Access
    resource "aws_security_group_rule" "all_outbound_access" {
      from_port         = 0
      protocol          = "-1"
      security_group_id = aws_security_group.cc_autoscale_sg_final.id
      to_port           = 0
      type              = "egress"
      cidr_blocks       = ["0.0.0.0/0"]
    }
