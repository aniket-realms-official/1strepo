################################################################################
# External WebServer Ec2 File #
################################################################################

resource "aws_instance" "external_webserver_ec2" {
  ami                    = var.extweb_ami
  instance_type          = var.extweb_instance_type
  count                  = var.extweb_instance_count
  tags                   = var.extweb_tags
  vpc_security_group_ids = var.sg_id_01
  subnet_id              = var.subnet_public_id
  #key_name               = var.ec2_key_pair
}
