variable "group_name" {
  type        = "string"
  description = "The name of the Group"
}

variable "user_names" {
  type        = "list"
  description = "A list of IAM User names to associate with the Group"
}

variable "member_account_id" {
  type        = "string"
  description = "The ID of the member account to grant access permissions to the users in the Group"
}

variable "role_name" {
  type        = "string"
  default     = "OrganizationAccountAccessRole"
  description = "The name of the role in the member account to grant permissions to delegated IAM users"
}

variable "policy_name" {
  type        = "string"
  default     = "OrganizationAccountAccessPolicy"
  description = "The name of the policy to attach to the Group"
}
