variable "pri_sub_cidr_block" {
  description = ""
  type        = string
  default     = "10.0.0.64/26"
}

variable "pri_sub_availability_zone" {
  description = ""
  type        = string
  default     = "us-west-1b"
}

variable "pri_sub_tags" {
  description = "Tags to apply to resources created by module"
  type        = map(string)
  default = {
    CreatedByTerraform = "true"
    Environment        = "dev"
    Name               = "subnet_private"
  }
}

variable "vpc_id" {
  type = string
}
