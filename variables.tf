variable "user_names" {
  type        = list(string)
  description = "A list of IAM User names to associate with the Group"
}

variable "role_arns" {
  type        = map(string)
  default     = {}
  description = "A map of alias -> IAM Role ARNs the users in the Group can assume"
}

variable "require_mfa" {
  type        = string
  default     = "false"
  description = "Require the users to have MFA enabled"
}

variable "enabled" {
  type        = string
  description = "Whether to create these resources"
  default     = "true"
}

variable "namespace" {
  type        = string
  description = "Namespace (e.g. `cp` or `cloudposse`)"
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`, `infra`)"
}

variable "name" {
  type        = string
  description = "Name  (e.g. `app` or `cluster`)"
}

variable "switchrole_url_template" {
  type        = string
  description = "URL template for the IAM console to switch to the roles"
  default     = "https://signin.aws.amazon.com/switchrole?account=%s&roleName=%s&displayName=%s"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `namespace`, `stage`, `name`, and `attributes`"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)"
}

