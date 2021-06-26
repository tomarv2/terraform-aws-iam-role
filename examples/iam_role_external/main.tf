provider "aws" {
  region  = "us-west-2"
  profile = "<aws profile to use>"
}

module "iam_role" {
  source = "../../modules/iam_role_external"

  name        = "demo-role"
  external_id = "123456789012"
  # ----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
