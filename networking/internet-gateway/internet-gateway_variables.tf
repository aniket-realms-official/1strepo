variable "ig_tags" {
  description = "Tags to apply to resources created by module"
  type        = map(string)
  default = {
    CreatedByTerraform = "true"
    Environment        = "dev"
    Name               = "InternetGateway"
  }
}

variable "vpc_id" {
  type = string
}
