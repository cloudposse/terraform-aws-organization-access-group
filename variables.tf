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
  description = "The name of the Role in the member account to grant permissions to the users in the Group"
}

variable "require_mfa" {
  type        = "string"
  default     = "false"
  description = "Require the users to have MFA enabled"
}

variable "enabled" {
  type        = "string"
  description = "Whether to create these resources"
  default     = "true"
}

variable "namespace" {
  type        = "string"
  description = "Namespace (e.g. `cp` or `cloudposse`)"
}

variable "stage" {
  type        = "string"
  description = "Stage (e.g. `prod`, `dev`, `staging`, `infra`)"
}

variable "name" {
  type        = "string"
  description = "Name  (e.g. `app` or `cluster`)"
}

variable "delimiter" {
  type        = "string"
  default     = "-"
  description = "Delimiter to be used between `namespace`, `stage`, `name`, and `attributes`"
}

variable "attributes" {
  type        = "list"
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)"
}
