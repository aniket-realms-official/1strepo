######################
# EBS Resource Block #
######################

resource "aws_ebs_volume" "ebs_volumne" {
  availability_zone = "us-west-2a"              // az where ebs will be launched
  size              = 1                         // size will be always in GB
}
