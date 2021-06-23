
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

variable "ec2_tags_Public" {
  description = "Tags to apply to resources created by ec2 module"
  type        = map(string)
  default = {
    CreatedByTerraform = "true"
    Environment        = "dev"
    Name               = "WebServer"
  }
}

variable "ec2_tags_Private" {
  description = "Tags to apply to resources created by ec2 module"
  type        = map(string)
  default = {
    CreatedByTerraform = "true"
    Environment        = "dev"
    Name               = "AppServer"
  }
}

variable "ec2_count" {
  description = "Define number of instance required"
  type        = number
  default     = "1"
}

variable "sg_id_01" {
  #default = ["${aws_security_group.sg_01.id}"]
}

variable "sg_id_02" {
  #default = ["${aws_security_group.sg_02.id}"]
}

variable "subnet_public_id" {
  type = string
  #default = aws_subnet.subnet_public.id
}

variable "subnet_private_id" {
  type = string
  #default = aws_subnet.subnet_private.id
}

# variable "ec2_key_pair" {
#   type = string
#   #default = aws_key_pair.generated_key.myec2keypair
# }
