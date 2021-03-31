variable "teamid" {
  description = "(Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
}

variable "prjid" {
  description = "(Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
}

variable "profile_to_use" {
  description = "Getting values from ~/.aws/credentials"
  default     = "default"
}

variable "name" {
  description = "The name of the IAM Role."
  type        = string
}

variable "path" {
  description = "The path to the IAM Role."
  type        = string
  default     = "/"
}

variable "description" {
  description = "The description of the IAM Role."
  default     = null
}

variable "force_detach_policies" {
  description = "Forcibly detach the policy of the role."
  type        = bool
  default     = false
}

variable "policy_arn" {
  description = "Attaches the policies to the IAM Role."
  type        = list(any)
}

variable "policy_identifier" {
  description = "List of user ARNs or Resource Names that are granted to assume the role. e.g. arn:aws:iam::123456789012:role/SuperAdmin or ec2.amazonaws.com"
  default     = ["ec2.amazonaws.com"]
}

variable "aws_region" {
  default = "us-west-2"
}

variable "role_name" {
  default = ""
}

variable "external_id" {
  description = "External ID provided by third party."
  type        = string
}

variable "mfa_required" {
  description = "Require MFA to assume the role."
  type        = string
  default     = "false"
}

variable "role_permission_boundary" {
  description = "IAM policy ARN limiting the maximum access this role can have"
  type        = string
  default     = ""
}

variable "role_type" {
  description = "Type of role: e.g. AWS, Service"
  default     = "Service"
}

variable "deploy_iam_role" {
  default = true
}

variable "deploy_iam_instance_profile" {
  default = true
}