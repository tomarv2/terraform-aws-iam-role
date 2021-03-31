output "iam_role_arn" {
  description = "The ARN of IAM Role"
  value       = join("", aws_iam_role.default.*.arn)
}

output "iam_role_id" {
  description = "The ID of IAM Role"
  value       = join("", aws_iam_role.default.*.id)
}

output "unique_id" {
  description = "The ARN Unique ID of IAM Role"
  value       = join("", aws_iam_role.default.*.unique_id)
}

output "instance_profile_name" {
  description = "The Instance profile Name"
  value       = join("", aws_iam_instance_profile.default.*.name)
}