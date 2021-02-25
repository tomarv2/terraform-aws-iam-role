# NOTE: due to limited IAM permissions, using 2 different roles:
# 1. create IAM role/policy
# 2. push state to S3
#
profile_to_use              = "demo_iam_role"
email                       = "demo@demo.com"
name                        = "rumse-demo-role"
#-------------------------------------------------------------------
# Note: Do not change teamid and prjid once set.
teamid                      = "rumse"
prjid                       = "demo-lambda-role"
