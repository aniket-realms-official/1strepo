# Query all avilable Availibility Zone
data "aws_availability_zones" "available" {}

# VPC Creation Block
resource "aws_vpc" "CoreCard_VPC_Final" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = var.vpc_instance_tenancy
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = var.vpc_tags
}

# Internet Gateway Creation Block
resource "aws_internet_gateway" "IGW_Final" {
  vpc_id = aws_vpc.CoreCard_VPC_Final.id
  tags = var.ig_tags
}

# Public Subnet
resource "aws_subnet" "public_subnet" {
  count                   = 2
  cidr_block              = "${var.public_cidrs[count.index]}"
  vpc_id                  = "${aws_vpc.CoreCard_VPC_Final.id}"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"

  tags = {
    Name = "CoreCard-public-subnet-Final-Saurabh.${count.index + 1}"
  }
}

# Private Subnet
resource "aws_subnet" "private_subnet" {
  count             = 2
  cidr_block        = "${var.private_cidrs[count.index]}"
  vpc_id            = "${aws_vpc.CoreCard_VPC_Final.id}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"

  tags = {
    Name = "CoreCard-private-subnet-Final-Saurabh.${count.index + 1}"
  }
}

# Public Route Table

resource "aws_route_table" "public_route_final_saurabh" {
  vpc_id = "${aws_vpc.CoreCard_VPC_Final.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.IGW_Final.id}"
  }

  tags = {
    Name = "public-route-final-saurabh"
  }
}

# Private Route Table

resource "aws_default_route_table" "private_route_final_saurabh" {
  default_route_table_id = "${aws_vpc.CoreCard_VPC_Final.default_route_table_id}"

  route {
    nat_gateway_id = "${aws_nat_gateway.corecard-nat-gateway-saurabh.id}"
    cidr_block     = "0.0.0.0/0"
  }

  tags = {
    Name = "private-route-final-saurabh"
  }
}

# Associate Public Subnet with Public Route Table
resource "aws_route_table_association" "public_subnet_association" {
  count          = 2
  route_table_id = "${aws_route_table.public_route_final_saurabh.id}"
  subnet_id      = "${aws_subnet.public_subnet.*.id[count.index]}"
  depends_on     = [aws_route_table.public_route_final_saurabh, aws_subnet.public_subnet]
}

# Associate Private Subnet with Private Route Table
resource "aws_route_table_association" "private_subnet_assoc" {
  count          = 2
  route_table_id = "${aws_default_route_table.private_route_final_saurabh.id}"
  subnet_id      = "${aws_subnet.private_subnet.*.id[count.index]}"
  depends_on     = [aws_default_route_table.private_route_final_saurabh, aws_subnet.private_subnet]
}

# eip creation
resource "aws_eip" "corecard-nat-eip-saurabh" {
  vpc = true
}


# NAT Gateway creation
resource "aws_nat_gateway" "corecard-nat-gateway-saurabh" {
  allocation_id = "${aws_eip.corecard-nat-eip-saurabh.id}"
  subnet_id     = "${aws_subnet.public_subnet.0.id}"
}

# Security Group Creation
resource "aws_security_group" "cc_sg_final" {
  name        = "sg_final"
  vpc_id      = aws_vpc.CoreCard_VPC_Final.id
}

# Ingress HTTP rule
resource "aws_security_group_rule" "http_inbound_access" {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    type        = "ingress"
    security_group_id = aws_security_group.cc_sg_final.id
  }

# Ingress HTTPS rule
  resource "aws_security_group_rule" "https_inbound_access" {
      description = "HTTPS"
      from_port   = 443
      to_port     = 443
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
      type        = "ingress"
      security_group_id = aws_security_group.cc_sg_final.id
    }

# Ingress HTTPS rule
  resource "aws_security_group_rule" "rdp_inbound_access" {
      description = "RDP"
      from_port   = 3389
      to_port     = 3389
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
      type        = "ingress"
      security_group_id = aws_security_group.cc_sg_final.id
    }

    # All OutBound Access
    resource "aws_security_group_rule" "all_outbound_access" {
      from_port         = 0
      protocol          = "-1"
      security_group_id = aws_security_group.cc_sg_final.id
      to_port           = 0
      type              = "egress"
      cidr_blocks       = ["0.0.0.0/0"]
    }
