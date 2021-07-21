variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type        = string
}

variable "vpc_instance_tenancy" {
  description = ""
  type        = string
  default     = "default"
}

variable "vpc_name" {}

variable "private_cidrs" {
  type = list(string)
}
variable "private_subnet_name" {}

variable "sg_name" {}
