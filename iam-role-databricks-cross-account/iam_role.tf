# https://github.com/Smartbrood/terraform-aws-ec2-iam-role/blob/master/README.md
locals{
  role_name = var.name != null ? var.name : "${var.teamid}-${var.prjid}"
//  assume_role_policy = var.assume_role_policy != "" ? var.assume_role_policy : data.aws_iam_policy_document.policy_document.json
}

data "aws_iam_policy_document" "policy_document" {
  statement {
    actions             = ["sts:AssumeRole"]
    principals {
      type              = "Service"
      identifiers       = var.policy_identifier
    }
  }
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
  assume_role_policy    = data.databricks_aws_assume_role_policy.this.json #local.assume_role_policy
  tags                  = merge(local.shared_tags)
}

data "databricks_aws_assume_role_policy" "this" {
  external_id = var.databricks_account_id
}

data "databricks_aws_crossaccount_policy" "this" {
}

resource "aws_iam_role_policy" "this" {
  name   = "${var.teamid}-${var.prjid}-policy"
  role   = aws_iam_role.iam_role.id
  policy = data.databricks_aws_crossaccount_policy.this.json
}
