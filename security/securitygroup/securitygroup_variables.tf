
variable "sg_tags" {
  description = "Tags to apply to resources created by module"
  type        = map(string)
  default = {
    CreatedByTerraform = "true"
    Environment        = "dev"
    Name               = "SecurityGroup"
  }
}
variable "vpc_id" {
  type = string
}
