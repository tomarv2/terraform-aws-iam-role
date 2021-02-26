terraform {
  required_version            = ">= 0.14"
  required_providers {
    aws = {
      version                     = "3.29"
    }
    databricks = {
      source                  = "databrickslabs/databricks"
      version                 = "0.3.1"
    }
  }
}

provider "aws" {
  profile                     = var.profile_to_use
  region                      = var.aws_region
}
