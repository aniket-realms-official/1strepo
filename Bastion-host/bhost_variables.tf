## Bastion Host Variable Declaration ##

variable "instance_type" {
  default = "t2.micro"
}

variable "security_group" {}

variable "subnets" {
  type = list(string)
}

variable "b_host_name" {}

variable "b_host_count" {
  default = 2
}
