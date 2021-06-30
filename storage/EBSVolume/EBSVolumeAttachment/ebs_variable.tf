variable "ebs_windows_ami" {
  description = "ami of windwows instance to launch"
  type = string
  default = "ami-0807f3d00dc7f1d6e"
}

variable "ebs_az" {
  description = "az where ec2 instance will be launched"
  type = string
  default = "us-west-1a"
}

variable "ebs_inst_type" {
  description = "ebs instance type"
  type = string
  default = "t2.micro"
}

variable "ebs_inst_tags" {
  description = "Tags for instance with ebs volume"
  type = map(string)
  default = {
  CreatedByTerraform = "true"
  Environment        = "test"
  Name               = "Instance_with_EBS"
}
}

variable "volume_size" {
  description = "Volume Size in GB's"
  type = number
  default = "1"
}
