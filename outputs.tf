output "role_arn" {
  description = "ARN of the IAM Role"
  value       = [for role in aws_iam_role.this : role.arn]
}

output "role_name" {
  description = "Name of the IAM Role"
  value       = [for role in aws_iam_role.this : role.name]
}

output "role_unique_id" {
  description = "ARN Unique ID of IAM Role"
  value       = [for role in aws_iam_role.this : role.unique_id]
}

output "instance_profile_name" {
  description = "Instance profile name"
  value       = [for profile in aws_iam_instance_profile.this : profile.name]
}
