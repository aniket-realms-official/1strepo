variable "intweb_ami" {
   description = "ami to launch internal webserver. Please enter region specific ami"
   type = string
   default = "ami-04a84b17679da3d3f"
}

variable "intweb_instance_type" {
  description = "select instance type to launch for internal WebServer"
  type = string
  default = "t2.micro"
}

variable "intweb_instance_count" {
  description = "Number of internal webserver to launch"
  type = number
  default = 1
}

variable "intweb_tags" {
  description = "Tags for internal webserver"
  type = map(string)
  default = {
    CreatedByTerraform = "true"
    Environment        = "dev"
    Name               = "internal WebServer"
  }
}

variable "sg_id_01" {
}

variable "subnet_public_id" {
  type = string
}
