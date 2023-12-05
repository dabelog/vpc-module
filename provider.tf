required_providers {
    aws = {
      source  = "aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"
}
