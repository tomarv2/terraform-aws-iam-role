module "iam_role" {
  source = "../../modules/iam_role_instance"

  name           = "delme"
  profile_to_use = "aws-dev-security_databricks-iam-admin"
  policy_arn     = ["arn:aws:iam::755921336062:role/security-demo-ec2-role"]
  # ----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
