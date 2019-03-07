## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attributes | Additional attributes (e.g. `1`) | list | `<list>` | no |
| delimiter | Delimiter to be used between `namespace`, `stage`, `name`, and `attributes` | string | `-` | no |
| enabled | Whether to create these resources | string | `true` | no |
| name | Name  (e.g. `app` or `cluster`) | string | - | yes |
| namespace | Namespace (e.g. `cp` or `cloudposse`) | string | - | yes |
| require_mfa | Require the users to have MFA enabled | string | `false` | no |
| role_arns | A list of IAM Role ARNs the users in the Group can assume | list | `<list>` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`, `infra`) | string | - | yes |
| switchrole_url | URL to the IAM console to switch to a role | string | `https://signin.aws.amazon.com/switchrole?account=%s&roleName=%s&displayName=%s` | no |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`) | map | `<map>` | no |
| user_names | A list of IAM User names to associate with the Group | list | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| group_arn | The ARN assigned by AWS for the Group |
| group_id | The Group's ID |
| group_name | The Group's name |
| group_unique_id | Group's unique ID assigned by AWS |
| policy_id | The policy ID |
| policy_name | The name of the policy |
| switchrole_url | URL to the IAM console to switch to the role |

