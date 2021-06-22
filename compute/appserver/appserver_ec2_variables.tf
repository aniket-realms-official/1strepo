variable "appserver_ec2_ami" {
   description = "ami to launch Appserver. Please enter region specific ami"
   type = string
   default = "ami-04a84b17679da3d3f"
}

variable "appserver_ec2_instance_type" {
  description = "select instance type to launch for AppServer"
  type = string
  default = "t2.micro"
}

variable "appserver_ec2_count" {
  description = "Number of  Appserver to launch"
  type = number
  default = 1
}

variable "appserver_ec2_tags_private" {
  description = "Tags for App server"
  type = map(string)
  default = {
    CreatedByTerraform = "true"
    Environment        = "dev"
    Name               = "AppServer"
  }
}

variable "sg_id_02" {
}

variable "subnet_private_id" {
  type = string
}
