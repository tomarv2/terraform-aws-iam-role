output "iam_role_arn" {
  description = "The ARN of IAM Role"
  value       = aws_iam_role.default.arn
}

output "iam_role_id" {
  description = "The ID of IAM Role"
  value       = aws_iam_role.default.id
}

output "unique_id" {
  description = "The ARN Unique ID of IAM Role"
  value       = aws_iam_role.default.unique_id
}

output "profile_name" {
  description = "The Instance profile Name"
  value       = aws_iam_instance_profile.default.name
}