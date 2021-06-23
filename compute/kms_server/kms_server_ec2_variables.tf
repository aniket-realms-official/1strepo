variable "kms_server_ec2_ami" {
   description = "ami to launch KMS server. Please enter region specific ami"
   type = string
   default = "ami-04a84b17679da3d3f"
}

variable "kms_server_ec2_instance_type" {
  description = "select instance type to launch for KMS Server"
  type = string
  default = "t2.micro"
}

variable "kms_server_ec2_count" {
  description = "Number of  KMS server to launch"
  type = number
  default = 1
}

variable "kms_server_ec2_tags_private" {
  description = "Tags for KMS server"
  type = map(string)
  default = {
    CreatedByTerraform = "true"
    Environment        = "dev"
    Name               = "KMSServer"
  }
}

variable "sg_id_02" {
}

variable "subnet_private_id" {
  type = string
}
