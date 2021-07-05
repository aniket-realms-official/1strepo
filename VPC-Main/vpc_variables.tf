variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type        = string
}

variable "vpc_instance_tenancy" {
  description = ""
  type        = string
  default     = "default"
}

variable "vpc_tags" {
  description = "Tags to apply to resources created by ec2 module"
  type        = map(string)
  default = {
    CreatedByTerraform = "true"
    Environment        = "dev"
    Name               = "CoreCard_VPC_Final"
  }
}

variable "ig_tags" {
  description = "Tags to apply to resources created by module"
  type        = map(string)
  default = {
    CreatedByTerraform = "true"
    Environment        = "dev"
    Name               = "IGW_Final"
  }
}

variable "public_cidrs" {
  type = list(string)
}

variable "private_cidrs" {
  type = list(string)
}
