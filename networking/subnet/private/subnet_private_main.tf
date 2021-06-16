resource "aws_subnet" "subnet_private" {
  vpc_id            = var.vpc_id
  cidr_block        = var.pri_sub_cidr_block
  availability_zone = var.region
  tags              = var.pri_sub_tags
}
