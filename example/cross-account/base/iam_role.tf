module "iam_role" {
  source = "../../../iam_role_external"

  name                    = var.name
  email                   = var.email
  teamid                  = var.teamid
  prjid                   = var.prjid
  profile_to_use          = var.profile_to_use
  policy_identifier       = var.policy_identifier
  policy_arn              = var.policy_arn
//  external_id             = var.external_id
  assume_role_policy      = var.assume_role_policy
}
