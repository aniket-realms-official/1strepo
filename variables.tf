variable "region" {
  description = "Use AWS region"
  type        = string
}
variable "ec2_count" {
default = "2"
}
variable "ebs_vol_size" {
default = "10"
}
variable "instance_type" {
default = "t2.micro"
}
