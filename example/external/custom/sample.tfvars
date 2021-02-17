# NOTE: due to limited IAM permissions, using 2 different roles:
# 1. create IAM role/policy
# 2. push state to S3
#
profile_to_use              = "demo_iam_role"
email                       = "demo@demo.com"
name                        = "demo-lambda-role"
policy_arn                  = ["arn:aws:iam::123456789012:policy/demo-lambda-policy", "arn:aws:iam::aws:policy/SecretsManagerReadWrite"]
//policy_identifier           = ["lambda.amazonaws.com"]
//external_id                 = "123456789012"
assume_role_policy          = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::123456789012:root"
      },
      "Action": "sts:AssumeRole",
      "Condition": {
        "StringEquals": {
          "sts:ExternalId": "your_external_id"
        }
      }
    },
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

#-------------------------------------------------------------------
# Note: Do not change teamid and prjid once set.
teamid                      = "security"
prjid                       = "demo-lambda-role"
