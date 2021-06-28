terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
in providers.tf
provider "aws" {
  region = "${var.region}"
}
pri_sub_availability_zone = "${var.pri_sub_availability_zone}"
pub_az = "${var.pub_az"}
