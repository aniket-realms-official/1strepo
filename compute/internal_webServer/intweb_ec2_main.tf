################################################################################
# External WebServer Ec2 File #
################################################################################

resource "aws_instance" "internal_webserver_ec2" {
  ami                    = var.intweb_ami
  instance_type          = var.intweb_instance_type
  count                  = var.intweb_instance_count
  tags                   = var.intweb_tags
  vpc_security_group_ids = var.sg_id_01
  subnet_id              = var.subnet_public_id
  #key_name               = var.ec2_key_pair
}
