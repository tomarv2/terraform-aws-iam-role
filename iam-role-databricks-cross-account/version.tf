terraform {
  required_version            = ">= 0.14"
  required_providers {
    aws = {
      version                     = "3.29"
    }
  }
}

provider "aws" {
  profile                     = var.profile_to_use
}
