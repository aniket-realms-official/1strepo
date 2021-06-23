variable "extweb_ami" {
   description = "ami to launch external webserver. Please enter region specific ami"
   type = string
   default = "ami-04a84b17679da3d3f"
}

variable "extweb_instance_type" {
  description = "select instance type to launch for external WebServer"
  type = string
  default = "t2.micro"
}

variable "extweb_instance_count" {
  description = "Number of ext webserver to launch"
  type = number
  default = 1
}

variable "extweb_tags" {
  description = "Tags for external webserver"
  type = map(string)
  default = {
    CreatedByTerraform = "true"
    Environment        = "dev"
    Name               = "External WebServer"
  }
}

variable "sg_id_01" {
}

variable "subnet_public_id" {
  type = string
}
