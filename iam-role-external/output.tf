output "iam_role_arn" {
  description = "The arn of iam role"
  value       = aws_iam_role.iam_role.arn
}

output "iam_role_id" {
  description = "The id of iam role"
  value       = aws_iam_role.iam_role.id
}


output "unique_id" {
  description = "The ARN unique id of iam role"
  value       = aws_iam_role.iam_role.unique_id
}

output "profile_name" {
  description = "The Instance profile name"
  value       = aws_iam_instance_profile.instance_profile.name
}

output "managed_policy_arn" {
  description = "managed policy arn"
  value       = aws_iam_role_policy_attachment.managed_policy.*.policy_arn
}

output "inline_policy_id" {
  description = "inline policy id"
  value       = aws_iam_role_policy.inline_policy.*.id
}
