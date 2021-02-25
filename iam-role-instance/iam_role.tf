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
  assume_role_policy    = data.aws_iam_policy_document.instance.json
  tags                  = merge(local.shared_tags)
}

data "aws_iam_policy_document" "instance" {
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
  count                 = length(var.policy_arn)
  role                  = aws_iam_role.this.name
  policy_arn            = var.policy_arn[count.index]
}