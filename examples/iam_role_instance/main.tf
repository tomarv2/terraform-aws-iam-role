terraform {
  required_version = ">= 1.0.1"
  required_providers {
    aws = {
      version = "~> 3.74"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

module "iam_role" {
  source = "../../modules/iam_role_instance"

  name       = "demo-role"
  policy_arn = ["<existing policy arn>"]
  # ----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
