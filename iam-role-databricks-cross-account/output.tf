output "iam_role_arn" {
  description = "The arn of iam role"
  value       = aws_iam_role.iam_role.arn
}

output "iam_role_id" {
  description = "The id of iam role"
  value       = aws_iam_role.iam_role.id
}


output "unique_id" {
  description = "The ARN Unique ID of IAM Role"
  value       = aws_iam_role.iam_role.unique_id
}

output "profile_name" {
  description = "The Instance profile Name"
  value       = aws_iam_instance_profile.instance_profile.name
}


output "aws_iam_role_policy" {
  description = "iam role policy"
  value       = aws_iam_role_policy.this.id
}