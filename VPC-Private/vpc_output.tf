output "vpc_id" {
  value = aws_vpc.CoreCard_VPC_Final.id
}

output "private_subnet1" {
  value = element(aws_subnet.private_subnet.*.id, 1)
}

output "private_subnet2" {
  value = element(aws_subnet.private_subnet.*.id, 2)
}

output "private_subnets" {
  value = aws_subnet.private_subnet.*.id
}

output "security_group" {
  value = aws_security_group.private-sg.id
}
