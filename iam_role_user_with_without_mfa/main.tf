locals {
  shared_tags  = map(
      "Name", "${var.teamid}-${var.prjid}",
      "Owner", var.email,
      "Team", var.teamid,
      "Project", var.prjid
  )
}

provider "aws" {
  region                      = var.aws_region
  profile                     = var.profile_to_use
  version                     = "~> 2.61"
}

terraform {
  required_version            = ">= 0.12"
}