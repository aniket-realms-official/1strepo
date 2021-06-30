resource "aws_security_group" "sg_01" {
  name        = "sg_01"
  description = "This firewall allows RDP from internet"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    description = "HTTPS"
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
   }

   ingress {
    description = "RDP"
    from_port = 3389
    to_port = 3389
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.sg_tags
}

resource "aws_security_group" "sg_02" {
  name        = "sg_02"
  description = "This firewall does not allow connection from Internet"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/27"]
  }

   ingress {
    description = "MSSQL"
    from_port   = 1433
    to_port     = 1433
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/27"]
  }
}
