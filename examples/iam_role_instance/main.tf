module "iam_role" {
  source = "../../modules/iam_role_instance"

  name       = "demo-role"
  policy_arn = ["<existing policy arn>"]
  # ----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
