# NOTE: due to limited IAM permissions, using 2 different roles:
# 1. create IAM role/policy
# 2. push state to S3
#
profile_to_use              = "iam-admin"
email                       = "demo@demo.com"
name                        = "rumse-demo-ec2-role"
assume_role_policy          = data.databricks_aws_assume_role_policy.this.json
role_policy                 = data.databricks_aws_crossaccount_policy.this.json
#-------------------------------------------------------------------
# Note: Do not change teamid and prjid once set.
teamid                      = "rumse"
prjid                       = "demo-ec2-role"
