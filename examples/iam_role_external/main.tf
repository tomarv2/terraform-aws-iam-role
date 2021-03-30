module "iam_role" {
  source = "../../modules/iam_role_external"

  name           = "delme"
  profile_to_use = ""
  external_id = ""
  # ----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
