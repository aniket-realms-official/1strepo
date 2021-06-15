resource "aws_route_table" "rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.ig_id
  }

  tags = var.rt_tags
}



resource "aws_route_table_association" "a" {
  subnet_id      = var.subnet_public_id
  route_table_id = aws_route_table.rt.id
}

//resource "aws_route_table_association" "b" {
//  subnet_id      = var.subnet_public_internal_id
//  route_table_id = aws_route_table.rt.id
//}

resource "aws_route_table_association" "c" {
  subnet_id      = var.private_subnet_id
  route_table_id = aws_route_table.rt.id
}
