locals {
  # https://github.com/Smartbrood/terraform-aws-ec2-iam-role/blob/master/README.md
  role_name          = var.name != null ? var.name : "${var.teamid}-${var.prjid}"
  assume_role_policy = coalesce(var.assume_role_policy, data.aws_iam_policy_document.policy_document.json)
}
