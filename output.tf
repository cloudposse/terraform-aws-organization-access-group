output "group_name" {
  value       = join("", aws_iam_group.default.*.name)
  description = "The Group's name"
}

output "group_id" {
  value       = join("", aws_iam_group.default.*.id)
  description = "The Group's ID"
}

output "group_unique_id" {
  value       = join("", aws_iam_group.default.*.unique_id)
  description = "Group's unique ID assigned by AWS"
}

output "group_arn" {
  value       = join("", aws_iam_group.default.*.arn)
  description = "The ARN assigned by AWS for the Group"
}

output "policy_name" {
  value = join(
    "",
    coalescelist(
      aws_iam_group_policy.without_mfa.*.name,
      aws_iam_group_policy.with_mfa.*.name,
    ),
  )
  description = "The name of the policy"
}

output "policy_id" {
  value = join(
    "",
    coalescelist(
      aws_iam_group_policy.without_mfa.*.id,
      aws_iam_group_policy.with_mfa.*.id,
    ),
  )
  description = "The policy ID"
}

output "switchrole_urls" {
  description = "List of URL to the IAM console to switch to the roles"
  value = [formatlist(
    var.switchrole_url_template,
    null_resource.role.*.triggers.account_id,
    null_resource.role.*.triggers.role_name,
    null_resource.role.*.triggers.alias,
  )]
}

