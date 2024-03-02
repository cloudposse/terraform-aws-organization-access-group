<!-- markdownlint-disable -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_label"></a> [label](#module\_label) | git::https://github.com/cloudposse/terraform-null-label.git | 0.25.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_policy.with_mfa](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy) | resource |
| [aws_iam_group_policy.without_mfa](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy) | resource |
| [aws_iam_user_group_membership.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership) | resource |
| [null_resource.role](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [aws_iam_policy_document.with_mfa](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.without_mfa](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attributes"></a> [attributes](#input\_attributes) | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between `namespace`, `stage`, `name`, and `attributes` | `string` | `"-"` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether to create these resources | `string` | `"true"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name  (e.g. `app` or `cluster`) | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace (e.g. `cp` or `cloudposse`) | `string` | n/a | yes |
| <a name="input_require_mfa"></a> [require\_mfa](#input\_require\_mfa) | Require the users to have MFA enabled | `string` | `"false"` | no |
| <a name="input_role_arns"></a> [role\_arns](#input\_role\_arns) | A map of alias -> IAM Role ARNs the users in the Group can assume | `map(string)` | `{}` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | Stage (e.g. `prod`, `dev`, `staging`, `infra`) | `string` | n/a | yes |
| <a name="input_switchrole_url_template"></a> [switchrole\_url\_template](#input\_switchrole\_url\_template) | URL template for the IAM console to switch to the roles | `string` | `"https://signin.aws.amazon.com/switchrole?account=%s&roleName=%s&displayName=%s"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. map(`BusinessUnit`,`XYZ`) | `map(string)` | `{}` | no |
| <a name="input_user_names"></a> [user\_names](#input\_user\_names) | A list of IAM User names to associate with the Group | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_group_arn"></a> [group\_arn](#output\_group\_arn) | The ARN assigned by AWS for the Group |
| <a name="output_group_id"></a> [group\_id](#output\_group\_id) | The Group's ID |
| <a name="output_group_name"></a> [group\_name](#output\_group\_name) | The Group's name |
| <a name="output_group_unique_id"></a> [group\_unique\_id](#output\_group\_unique\_id) | Group's unique ID assigned by AWS |
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | The policy ID |
| <a name="output_policy_name"></a> [policy\_name](#output\_policy\_name) | The name of the policy |
| <a name="output_switchrole_urls"></a> [switchrole\_urls](#output\_switchrole\_urls) | List of URL to the IAM console to switch to the roles |
<!-- markdownlint-restore -->
