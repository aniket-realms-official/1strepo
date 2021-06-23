variable "wcf_server_ec2_ami" {
   description = "ami to launch WCF server. Please enter region specific ami"
   type = string
   default = "ami-04a84b17679da3d3f"
}

variable "wcf_server_ec2_instance_type" {
  description = "select instance type to launch for WCF Server"
  type = string
  default = "t2.micro"
}

variable "wcf_server_ec2_count" {
  description = "Number of  WCF server to launch"
  type = number
  default = 1
}

variable "wcf_server_ec2_tags_private" {
  description = "Tags for external webserver"
  type = map(string)
  default = {
    CreatedByTerraform = "true"
    Environment        = "dev"
    Name               = "WCF_Server"
  }
}

variable "sg_id_02" {
}

variable "subnet_private_id" {
  type = string
}
