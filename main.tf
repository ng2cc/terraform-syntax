terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.39.1"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-2"
}

# Create a VPC
resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "main"
  }
}

# Create a Public Subnet
resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.default.id
  cidr_block = "10.0.100.0/24"

  tags = {
    Name = "hangaramit_public_subnet_1"
  }
}

# # Create a Private Subnet
# resource "aws_subnet" "hangaramit_private_subnet_1" {
#   vpc_id     = aws_vpc.default.id
#   cidr_block = "10.0.101.0/24"
#   tags = {
#     Name = "hangaramit_private_subnet_1"
#   }
# }

data "aws_subnet" "private_subnet_1" {
  id = "subnet-0c9e20da488c507d7"
}
