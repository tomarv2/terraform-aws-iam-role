output "role_arn" {
  description = "ARN of the IAM Role"
  value       = module.iam_role.role_arn
}

output "role_name" {
  description = "Name of the IAM Role"
  value       = module.iam_role.role_name
}

output "role_unique_id" {
  description = "ARN Unique ID of IAM Role"
  value       = module.iam_role.role_unique_id
}

output "instance_profile_name" {
  description = "Instance profile name"
  value       = module.iam_role.instance_profile_name
}
