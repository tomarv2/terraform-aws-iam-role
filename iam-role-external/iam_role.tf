# https://github.com/Smartbrood/terraform-aws-ec2-iam-role/blob/master/README.md
locals{
  role_name = var.name != null ? var.name : "${var.teamid}-${var.prjid}"
  assume_role_policy = var.assume_role_policy != "" ? var.assume_role_policy : data.aws_iam_policy_document.policy_document.json
}

resource "aws_iam_instance_profile" "instance_profile" {
  name                  = format("%s-%s",local.role_name, "profile")
  role                  = local.role_name
  path                  = var.path
}

resource "aws_iam_role" "iam_role" {
  name                  = local.role_name
  path                  = var.path
  description           = var.description
  force_detach_policies = var.force_detach_policies
  assume_role_policy    = local.assume_role_policy
  tags                  = merge(local.shared_tags)
}

data "aws_iam_policy_document" "policy_document" {
  statement {
    actions             = ["sts:AssumeRole"]
    principals {
      type              = "Service"
      identifiers       = var.policy_identifier
    }

    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values = [var.external_id]
    }
  }
}

resource "aws_iam_role_policy_attachment" "managed_policy" {
  count                 = length(var.policy_arn)
  role                  = aws_iam_role.iam_role.name
  policy_arn            = var.policy_arn[count.index]
}