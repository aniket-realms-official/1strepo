resource "aws_instance" "MyPublic_ec2" {
  ami                    = var.ec2_ami
  instance_type          = var.ec2_instance_type
  count                  = var.ec2_count
  tags                   = var.ec2_tags_Public
  #key_name               = var.ec2_key_pair
  vpc_security_group_ids = var.sg_id_01
  // ["${aws_security_group.sg_01.id}"]
  subnet_id              = var.subnet_public_id
}

resource "aws_instance" "MyPrivate_ec2" {
  ami                    = var.ec2_ami
  instance_type          = var.ec2_instance_type
  count                  = var.ec2_count
  tags                   = var.ec2_tags_Private
  #key_name               = var.ec2_key_pair
  vpc_security_group_ids = var.sg_id_02
  // ["${aws_security_group.sg_02.id}"]
  subnet_id              = var.subnet_private_id
}
