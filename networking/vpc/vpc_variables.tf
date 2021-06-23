variable "vpc_cidr_block" {
  description = ""
  type        = string
  default     = "10.0.0.0/24"
}

variable "vpc_instance_tenancy" {
  description = ""
  type        = string
  default     = "default"
}

variable "vpc_enable_dns_hostnames" {
  description = ""
  type        = bool
  default     = "true"
}


variable "vpc_tags" {
  description = "Tags to apply to resources created by ec2 module"
  type        = map(string)
  default = {
    CreatedByTerraform = "true"
    Environment        = "dev"
    Name               = "TF_CoreCard_VPC"
  }
}
