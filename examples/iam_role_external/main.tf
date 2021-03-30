module "iam_role" {
  source = "../../modules/iam_role_external"

  name           = "delme"
  profile_to_use = "iam-admin"
  external_id    = "123456789012"
  # ----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
