locals {
  shared_tags = map(
    "Name", "${var.teamid}-${var.prjid}",
    "team", var.teamid,
    "project", var.prjid
  )

  # https://github.com/Smartbrood/terraform-aws-ec2-iam-role/blob/master/README.md
  role_name = var.name != null ? var.name : "${var.teamid}-${var.prjid}"
}
