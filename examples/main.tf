terraform {
  required_version = ">= 1.0.1"
  required_providers {
    aws = {
      version = "~> 4.35"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

module "iam_role" {
  source = "../"

  roles_config = {
    "demo-role" = {
      policy_arn = "arn:aws:iam::123456789012:policy/demo-policy"
      assume_role_policy = <<-EOF
        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Effect": "Allow",
                    "Principal": {
                        "Service": [
                            "codebuild.amazonaws.com",
                            "lambda.amazonaws.com",
                            "events.amazonaws.com",
                            "ec2.amazonaws.com"
                        ]
                    },
                    "Action": "sts:AssumeRole"
                },
                {
                    "Effect": "Allow",
                    "Principal": {
                        "AWS": "arn:aws:iam::123456789012:root"
                    },
                    "Action": "sts:AssumeRole"
                }
            ]
        }
        EOF
      role_type = "Service"
      policy_identifier = ["lambda.amazonaws.com"]
    }
  }
  # ----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
