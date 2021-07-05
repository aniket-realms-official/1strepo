variable "instance_type" {
  default = "t2.micro"
}

variable "security_group" {}

variable "subnets" {
  type = list(string)
}

variable "ec2_name" {
}
