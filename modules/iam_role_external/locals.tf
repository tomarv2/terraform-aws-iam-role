locals {
  shared_tags = tomap(
    {
      "Name"    = "${var.teamid}-${var.prjid}",
      "team"    = var.teamid,
      "project" = var.prjid
    }
  )

  # https://github.com/Smartbrood/terraform-aws-ec2-iam-role/blob/master/README.md
  role_name          = var.name != null ? var.name : "${var.teamid}-${var.prjid}"
  assume_role_policy = coalesce(var.assume_role_policy, data.aws_iam_policy_document.policy_document.json)
}
