output "data_switchrole_urls" {
  description = "List of URL to the IAM console to switch to the roles"
  value       = ["${module.organization_access_group_data.switchrole_urls}"]
}
