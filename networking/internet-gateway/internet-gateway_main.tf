###############################################################################################################################################
#    Step3: Create a public facing internet gateway for connect our VPC/Network to the internet world and attach this gateway to our VPC      #
###############################################################################################################################################
resource "aws_internet_gateway" "ig_01" {
  vpc_id = var.vpc_id

  tags = var.ig_tags
}
