resource "aws_iam_instance_profile" "this" {
  for_each = var.roles_config != null ? var.roles_config : {}

  name = each.key
  role = each.key
  path = try(each.value.path, "/")
}

resource "aws_iam_role" "this" {
  for_each = var.roles_config != null ? var.roles_config : {}

  name                  = each.key
  path                  = try(each.value.path, "/")
  description           = try(each.value.description, "Terraform managed: ${var.teamid}-${var.prjid}")
  force_detach_policies = try(each.value.force_detach_policies, false)
  assume_role_policy    = try(each.value.assume_role_policy , join("", [for policy in data.aws_iam_policy_document.instance : policy.json]))
  tags                  = merge(local.shared_tags)
}

data "aws_iam_policy_document" "instance" {
  for_each = {
    for key, value in var.roles_config :
    key => value
    if try(value.assume_role_policy, null) == null
  }

  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = try(each.value.role_type, null)
      identifiers = try(each.value.policy_identifier, null)
    }
  }
}

resource "aws_iam_role_policy_attachment" "managed_policy" {
  for_each = var.roles_config != null ? var.roles_config : {}

  role       = each.key
  policy_arn = each.value.policy_arn

  depends_on = [aws_iam_role.this]
}
