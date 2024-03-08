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

variable "envs" {
  type    = list(string)
  default = ["dev", "prd", ""]
}

module "vpc_list" {
  for_each = toset([for s in var.envs : s if s != ""])
  source   = "./custom_vpc"
  env      = each.key
}
