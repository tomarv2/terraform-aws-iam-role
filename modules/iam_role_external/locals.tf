locals {
  shared_tags = map(
    "Name", "${var.teamid}-${var.prjid}",
    "team", var.teamid,
    "project", var.prjid
  )

  role_name          = var.name != null ? var.name : "${var.teamid}-${var.prjid}"
  assume_role_policy = coalesce(var.assume_role_policy, data.aws_iam_policy_document.policy_document.json)
  role_policy        = coalesce(var.role_policy)
}
