variable "public_az" {
  default = ""
}
variable "private_az" {
  default = ""
}
variable "region" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "us-west-1"
}
