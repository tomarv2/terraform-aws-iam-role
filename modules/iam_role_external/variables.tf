variable "teamid" {
  description = "(Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
  type        = string
}

variable "prjid" {
  description = "(Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
  type        = string
}

variable "name" {
  description = "The name of the IAM Role."
  type        = string
  default     = null
}

variable "path" {
  description = "The path to the IAM Role."
  type        = string
  default     = "/"
}

variable "description" {
  description = "The description of the IAM Role."
  type        = string
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
  default     = []
}

variable "policy_identifier" {
  description = "List of user ARNs or Resource Names that are granted to assume the role. e.g. arn:aws:iam::123456789012:role/SuperAdmin or ec2.amazonaws.com"
  default     = ["ec2.amazonaws.com"]
  type        = list(any)
}

variable "external_id" {
  description = "External ID provided by third party."
  type        = string
  default     = ""
}

variable "assume_role_policy" {
  description = "Assume role policy."
  default     = ""
  type        = string
}

variable "role_type" {
  description = "Type of role: e.g. AWS, Service"
  type        = string
  default     = "Service"
}

variable "deploy_iam_role" {
  description = "feature flag to deploy this resource or not"
  type        = bool
  default     = true
}

variable "deploy_iam_instance_profile" {
  description = "feature flag to deploy this resource or not"
  type        = bool
  default     = true
}

variable "existing_role_name" {
  description = "name of existing iam role"
  default     = null
  type        = string
}
