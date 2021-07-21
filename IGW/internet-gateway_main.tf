## Internet Gateway Creation Block ##
resource "aws_internet_gateway" "IGW_Final" {
  vpc_id = var.vpc_id
  tags = {
    CreatedByTerraform = "true"
    Environment        = "dev"
    Name               = var.igw_name
  }
}
