module "iam_role" {
  source = "../../../iam-role-databricks-cross-account"

  name                    = var.name
  email                   = var.email
  teamid                  = var.teamid
  prjid                   = var.prjid
  profile_to_use          = var.profile_to_use

  databricks_account_id = var.databricks_account_id
}
