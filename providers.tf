terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-1"
  access_key = "AKIATC4BRTUBL5IC5BHN"
  secret_key = "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"
}
