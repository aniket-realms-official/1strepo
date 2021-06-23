variable "vpc_id" {
  type = string
}

variable "ig_id" {
  type = string
}

variable "rt_tags" {
  description = "Tags to apply to resources created by module"
  type        = map(string)
  default = {
    CreatedByTerraform = "true"
    Environment        = "dev"
    Name               = "RouteTable"
  }
}

variable "private_subnet_id" {
  type = string
}

variable "subnet_public_id" {
  type = string
}

#variable "subnet_public_internal_id" {
//  type = string
//}
