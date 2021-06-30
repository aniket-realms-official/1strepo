######################
# EBS Resource Block #
######################

resource "aws_volume_attachment" "ebs_att" {
  device_name = "xvdb"
  volume_id   = aws_ebs_volume.test_windows_ebs_volume.id
  instance_id = aws_instance.test_EBS_windows_server.id
}


# resource "aws_ebs_volume" "test_windows_ebs_volume" {
#   availability_zone = var.ebs_az
#   size              = var.volume_size
# }

# resource "aws_instance" "test_EBS_windows_server" {
#   ami               = var.ebs_windows_ami
#   availability_zone = var.ebs_az
#   instance_type     = var.ebs_inst_type
#   tags              = var.ebs_inst_tags
# }
