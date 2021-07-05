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
  region     = "us-west-2"
  access_key = "AKIATC4BRTUBI5VLGJRH"
  secret_key = "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"
}
