variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}
variable "ec2_instance_type" {
  description = "Combinations of CPU, memory, storage, and networking capacity"
  type        = string
  default     = "t2.micro"
}

variable "ec2_tags" {
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

variable "sg_id" {
  type = string
  default = ["${aws_security_group.sg_01.id}"]
}

variable "subnet_public_external_id" {
  type = string
  default = aws_subnet.subnet_public_external.id
}
