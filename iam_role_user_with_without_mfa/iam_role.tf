# https://github.com/Smartbrood/terraform-aws-ec2-iam-role/blob/master/README.md
locals{
  role_name = var.name != null ? var.name : "${var.teamid}-${var.prjid}"
}

resource "aws_iam_instance_profile" "this" {
  name                  = format("%s-%s",local.role_name, "profile")
  role                  = local.role_name
  path                  = var.path
}

resource "aws_iam_role" "this" {
  name                  = local.role_name
  path                  = var.path
  description           = var.description
  force_detach_policies = var.force_detach_policies
  assume_role_policy    = var.mfa_required ? data.aws_iam_policy_document.with_mfa.json : data.aws_iam_policy_document.without_mfa.json
  tags                  = merge(local.shared_tags)
}

# Trust relationship policy document for user that requires MFA to be enabled.
data "aws_iam_policy_document" "with_mfa" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = var.role_type
      identifiers = var.policy_identifier
    }

    condition {
      test     = "Bool"
      variable = "aws:MultiFactorAuthPresent"
      values   = ["true"]
    }
  }
}

# Trust relationship policy document for user that cannot enable MFA.
data "aws_iam_policy_document" "without_mfa" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = var.role_type
      identifiers = var.policy_identifier
    }
  }
}

resource "aws_iam_role_policy_attachment" "managed_policy" {
  count                 = length(var.policy_arn)
  role                  = aws_iam_role.this.name
  policy_arn            = var.policy_arn[count.index]
}