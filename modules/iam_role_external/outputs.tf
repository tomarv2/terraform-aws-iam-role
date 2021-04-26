output "iam_role_name" {
  description = "The Name of IAM Role"
  value       = join("", aws_iam_role.default.*.name)
}

output "iam_role_arn" {
  description = "The ARN of IAM Role"
  value       = join("", aws_iam_role.default.*.arn)
}

output "iam_role_id" {
  description = "The ID of IAM Role"
  value       = join("", aws_iam_role.default.*.id)
}

output "iam_role_unique_id" {
  description = "The ARN unique id of iam role"
  value       = join("", aws_iam_role.default.*.unique_id)
}

output "instance_profile_name" {
  description = "The Instance profile name"
  value       = join("", aws_iam_instance_profile.instance_profile.*.name)
}

output "managed_policy_arn" {
  description = "managed policy arn"
  value       = join("", aws_iam_role_policy_attachment.managed_policy.*.policy_arn)
}
