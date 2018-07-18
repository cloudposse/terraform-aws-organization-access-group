
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attributes | Additional attributes (e.g. `1`) | list | `<list>` | no |
| delimiter | Delimiter to be used between `namespace`, `stage`, `name`, and `attributes` | string | `-` | no |
| member_account_id | The ID of the member account to grant access permissions to the users in the Group | string | - | yes |
| name | Name  (e.g. `app` or `cluster`) | string | - | yes |
| namespace | Namespace (e.g. `cp` or `cloudposse`) | string | - | yes |
| require_mfa | Require the users to have MFA enabled | string | `false` | no |
| role_name | The name of the Role in the member account to grant permissions to the users in the Group | string | `OrganizationAccountAccessRole` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`, `infra`) | string | - | yes |
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

