#######################################
####### EC2 Resource Paramters ########
#######################################

variable "ec2_ami" {
  description = "Select the approriate ami id (region based)  from AWS console"
  type        = string
  default     = "ami-04a84b17679da3d3f"
}

variable "ec2_instance_type" {
  description = "Combinations of CPU, memory, storage, and networking capacity"
  type        = string
  default     = "t2.micro"
}

variable "ec2_name" {
  description = "Name tag for Ec2 instance, should be passed in main.tf file."
}

variable "ec2_count" {
  description = "Define number of instance required"
  type        = number
  default     = "1"
}

variable "sg_id" {
  #default = ["${aws_security_group.sg_01.id}"]
}

variable "subnet_id" {
  type = string
  #default = aws_subnet.subnet_public.id
}

#####################################
####### EBS Volume Paramters ########
#####################################

variable "volume_size" {
  description = "Volume Size in GB's"
  type = number
  default = "1"
}

variable "ec2_ebs_volume_count" {
  default = "1"
}
