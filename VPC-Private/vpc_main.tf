# Query all avilable Availibility Zone
data "aws_availability_zones" "available" {}

# VPC Creation Block
resource "aws_vpc" "CoreCard_VPC_Final" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = var.vpc_instance_tenancy
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    CreatedByTerraform = "true"
    Environment        = "dev"
    Name               = var.vpc_name
  }
}

# Private Subnet
resource "aws_subnet" "private_subnet" {
  count             = 2
  cidr_block        = var.private_cidrs[count.index]
  vpc_id            = aws_vpc.CoreCard_VPC_Final.id
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = format("%s_%s", var.private_subnet_name, count.index + 1)
  }
}

# Private Route Table
resource "aws_default_route_table" "private_route_final" {
  default_route_table_id = aws_vpc.CoreCard_VPC_Final.default_route_table_id

  tags = {
    Name = "private-route-final"
  }
}

# Associate Private Subnet with Private Route Table
resource "aws_route_table_association" "private_subnet_assoc" {
  count          = 2
  route_table_id = aws_default_route_table.private_route_final.id
  subnet_id      = aws_subnet.private_subnet.*.id[count.index]
  depends_on     = [aws_default_route_table.private_route_final, aws_subnet.private_subnet]
}

# Security Group Creation
resource "aws_security_group" "private-sg" {
  name   = var.sg_name
  vpc_id = aws_vpc.CoreCard_VPC_Final.id
}

# Ingress HTTP rule
resource "aws_security_group_rule" "http_inbound_access" {
  description       = "HTTP"
  from_port         = 80
  to_port           = 80
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
  security_group_id = aws_security_group.private-sg.id
}

# Ingress HTTPS rule
resource "aws_security_group_rule" "https_inbound_access" {
  description       = "HTTPS"
  from_port         = 443
  to_port           = 443
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
  security_group_id = aws_security_group.private-sg.id
}

# Ingress HTTPS rule
resource "aws_security_group_rule" "rdp_inbound_access" {
  description       = "RDP"
  from_port         = 3389
  to_port           = 3389
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
  security_group_id = aws_security_group.private-sg.id
}

# All OutBound Access
resource "aws_security_group_rule" "all_outbound_access" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.private-sg.id
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}
