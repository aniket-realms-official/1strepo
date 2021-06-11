resource "aws_instance" "myfirstEC2" {
  ami                = var.ec2_ami
  instance_type          = var.ec2_instance_type
  count                  = var.ec2_count
  tags                   = var.ec2_tags
#  vpc_security_group_ids = var.sg_id
#  subnet_id              = var.subnet_public_external_id
}
