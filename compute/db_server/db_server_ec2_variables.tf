variable "db_server_ec2_ami" {
   description = "ami to launch DB server. Please enter region specific ami"
   type = string
   default = "ami-04a84b17679da3d3f"
}

variable "db_server_ec2_instance_type" {
  description = "select instance type to launch for DB Server"
  type = string
  default = "t2.micro"
}

variable "db_server_ec2_count" {
  description = "Number of  DB server to launch"
  type = number
  default = 1
}

variable "db_server_ec2_tags_private" {
  description = "Tags for DB server"
  type = map(string)
  default = {
    CreatedByTerraform = "true"
    Environment        = "dev"
    Name               = "DB_Server"
  }
}

variable "sg_id_02" {
}

variable "subnet_private_id" {
  type = string
}
