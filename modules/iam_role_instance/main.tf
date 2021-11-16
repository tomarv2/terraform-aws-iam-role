resource "aws_iam_instance_profile" "default" {
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
  assume_role_policy    = var.assume_role_policy != null ? var.assume_role_policy : join("", data.aws_iam_policy_document.instance.*.json)
  tags                  = merge(local.shared_tags)
}

data "aws_iam_policy_document" "instance" {
  count = var.deploy_iam_role ? 1 : 0

  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = var.role_type
      identifiers = var.policy_identifier
    }
  }
}

resource "aws_iam_role_policy_attachment" "managed_policy" {
  count = var.deploy_iam_role ? length(var.policy_arn) : 0

  role       = var.existing_role_name != null ? var.existing_role_name : join("", aws_iam_role.default.*.name)
  policy_arn = var.policy_arn[count.index]
}
