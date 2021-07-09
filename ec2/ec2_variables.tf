variable "instance_type" {
  default = "t2.micro"
}
 
variable "security_group" {}
 
variable "subnets" {
  type = list(string)
}
 
variable "ec2_name" {
}
 
variable "ec2_count" {
  default = "2"
}
 
variable "ebs_vol_size" {
  default = "10"
}
