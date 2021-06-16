resource "aws_subnet" "subnet_private" {
  vpc_id            = var.vpc_id
  cidr_block        = var.pri_sub_cidr_block
  availability_zone = var.pri_sub_availability_zone
  tags              = var.pri_sub_tags
  region            = var.region
}
