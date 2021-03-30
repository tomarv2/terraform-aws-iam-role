data "aws_iam_policy_document" "policy_document" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = var.policy_identifier
    }

    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = [var.external_id]
    }
  }
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = format("%s-%s", local.role_name, "profile")
  role = local.role_name
  path = var.path
}

resource "aws_iam_role" "iam_role" {
  name                  = local.role_name
  path                  = var.path
  description           = var.description == null ? "Terraform managed: ${var.teamid}-${var.prjid}" : var.description
  force_detach_policies = var.force_detach_policies
  assume_role_policy    = local.assume_role_policy
  tags                  = merge(local.shared_tags)
}


resource "aws_iam_role_policy" "inline_policy" {
  count = length(var.role_policy)

  name   = "${var.teamid}-${var.prjid}-policy"
  role   = aws_iam_role.iam_role.id
  policy = local.role_policy
}

resource "aws_iam_role_policy_attachment" "managed_policy" {
  count = length(var.policy_arn)

  role       = aws_iam_role.iam_role.name
  policy_arn = var.policy_arn[count.index]
}