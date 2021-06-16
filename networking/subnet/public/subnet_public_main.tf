 ####################################################
#   Step2.2 : Public Subnet Creation      #
####################################################
resource "aws_subnet" "subnet_public" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.pub_cidr_block
  availability_zone       = var.pub_az
  map_public_ip_on_launch = var.map_public_ip
  tags = var.public_subnet__tags
}
