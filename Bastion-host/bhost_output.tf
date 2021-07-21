## Bastion Host Output variables ##

output "instance1_id" {
  value = element(aws_instance.bastion_host.*.id, 1)
}

output "instance2_id" {
  value = element(aws_instance.bastion_host.*.id, 2)
}

output "server_ip" {
  value = join(",", aws_instance.bastion_host.*.public_ip)
}

output "instance_id" {
  value = aws_instance.bastion_host.*.id
}
