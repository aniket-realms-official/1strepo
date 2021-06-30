variable "vpc_id" {
  type = string
}

########################################
# Variables for external public subnet #
########################################
variable "pub_cidr_block" {
  description = ""
  type        = string
  default     = "10.0.0.128/25"
}

variable "pub_az" {
  description = ""
  type        = string
//  default     = "us-east-1a"
}

variable "map_public_ip" {
  description = ""
  type        = bool
  default     = "true"
}

variable "public_subnet__tags" {
  description = "Tags to apply to resources created by module"
  type        = map(string)
  default = {
    CreatedByTerraform = "true"
    Environment        = "dev"
    Name               = "subnet_public"
  }
}


########################################
# Variables for internal public subnet #
########################################
/*variable "int_cidr_block" {
  description = ""
  type        = string
  default     = "10.0.0.0/25"
}

variable "int_az" {
  description = ""
  type        = string
  default     = "us-east-2a"
}

variable "int_map_public_ip" {
  description = ""
  type        = bool
  default     = "true"
}

variable "int_public_subnet__tags" {
  description = "Tags to apply to resources created by module"
  type        = map(string)
  default = {
    CreatedByTerraform = "true"
    Environment        = "dev"
    Name               = "subnet_public_internal"
  }
} */
