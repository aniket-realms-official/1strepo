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

variable "public_cidrs" {
  type = list(string)
}

variable "public_subnet_name" {}

variable "sg_name" {}
variable "gateway_id" {}
