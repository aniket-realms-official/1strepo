output "vpc_id" {
  value = aws_vpc.CoreCard_VPC_Final.id
}

output "subnet1" {
  value = element(aws_subnet.public_subnet.*.id, 1)
}

output "subnet2" {
  value = element(aws_subnet.public_subnet.*.id, 2)
}

output "public_subnets" {
  value = aws_subnet.public_subnet.*.id
}

output "security_group" {
  value = aws_security_group.public-sg.id
}
