output "iam_role_arn" {
  description = "The ARN of IAM Role"
  value       = module.iam_role.iam_role_arn
}

output "iam_role_id" {
  description = "The ID of IAM Role"
  value       = module.iam_role.iam_role_id
}

output "iam_role_unique_id" {
  description = "The ARN unique id of iam role"
  value       = module.iam_role.iam_role_unique_id
}

output "instance_profile_name" {
  description = "The Instance profile name"
  value       = module.iam_role.instance_profile_name
}

output "managed_policy_arn" {
  description = "managed policy arn"
  value       = module.iam_role.managed_policy_arn
}
