resource "aws_iam_instance_profile" "instance_profile" {
  count = var.deploy_iam_instance_profile ? 1 : 0

  name = format("%s-%s", local.role_name, "profile")
  role = local.role_name
  path = var.path
}

resource "aws_iam_role" "default" {
  count = var.deploy_iam_role ? 1 : 0

  name                  = local.role_name
  path                  = var.path
  description           = var.description == null ? "Terraform managed: ${var.teamid}-${var.prjid}" : var.description
  force_detach_policies = var.force_detach_policies
  assume_role_policy    = local.assume_role_policy
  tags                  = merge(local.shared_tags)
}

data "aws_iam_policy_document" "policy_document" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = var.role_type
      identifiers = var.policy_identifier
    }

    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = [var.external_id]
    }
  }
}

resource "aws_iam_role_policy_attachment" "managed_policy" {
  count = length(var.policy_arn)

  role       = var.existing_role_name != null ? var.existing_role_name : join("", aws_iam_role.default.*.name)
  policy_arn = var.policy_arn[count.index]
}
