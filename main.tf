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
<<<<<<< HEAD
  default = ["dev", "prd", ""]
=======
  default = ["남궁규철", "벨링엄"]
>>>>>>> 569837061003fd1f72e4f25830ac3045cbc33d25
}

module "vpc_list" {
  for_each = toset([for s in var.envs : s if s != ""])
  source   = "./custom_vpc"
  env      = each.key
}

