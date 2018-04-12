# terraform-aws-organization-access-group [![Build Status](https://travis-ci.org/cloudposse/terraform-aws-organization-access-group.svg?branch=master)](https://travis-ci.org/cloudposse/terraform-aws-organization-access-group)

Terraform module to create an IAM Group and Policy to grant permissions to delegated IAM users in the Organization's master account to access a member account

https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html


## Introduction

By default, when you create a member account as part of your Organization, AWS automatically creates `OrganizationAccountAccessRole` in the member account.

The role grants admin permissions to access the member account to delegated IAM users in the master account.

In the master account you need to create a Policy to grant permissions to IAM users to assume `OrganizationAccountAccessRole` in the member account.

This module does the following:

1. Creates an IAM Group
2. Adds the provided IAM users to the Group
3. Creates a Policy to grant permissions to the IAM users in the master account to assume `OrganizationAccountAccessRole` in the member account
4. Attaches the Policy to the Group


Users who are members of the Group will be able to assume the role and administer the member account by going here:

(change `XXXXXXXXXXXX` to the ID of the member account)

```
https://signin.aws.amazon.com/switchrole
                ?account=XXXXXXXXXXXX
                &roleName=OrganizationAccountAccessRole
                &displayName=Dev
```


<br/>

__NOTE__: Member accounts that you invite to join your Organization (that are not part of your Organization) do not automatically get `OrganizationAccountAccessRole` created.
You can use [terraform-aws-organization-access-role](https://github.com/cloudposse/terraform-aws-organization-access-role) module to create `OrganizationAccountAccessRole` role in an invited member account.

<br/>


## Usage

```hcl
module "organization_access_group" {
  source            = "git::https://github.com/cloudposse/terraform-aws-organization-access-group.git?ref=master"
  namespace         = "cp"
  stage             = "dev"
  name              = "cluster"
  user_names        = ["User1","User2"]
  member_account_id = "XXXXXXXXXXXXXX"
  require_mfa       = "true"
}
```


## Variables

|  Name                 |  Default                          |  Description                                                                             | Required |
|:----------------------|:----------------------------------|:-----------------------------------------------------------------------------------------|:--------:|
| `namespace`           | ``                                | Namespace (_e.g._ `cp` or `cloudposse`)                                                  | Yes      |
| `stage`               | ``                                | Stage (_e.g._ `prod`, `dev`, `staging`)                                                  | Yes      |
| `name`                | ``                                | Name  (_e.g._ `app` or `cluster`)                                                        | Yes      |
| `user_names`          | ``                                | A list of IAM User names to associate with the Group                                     | Yes      |
| `member_account_id`   | ``                                | The ID of the member account to grant access permissions to the users in the Group       | Yes      |
| `role_name`           | `OrganizationAccountAccessRole`   | The name of the Role in the member account to grant permissions to the users in the Group   | No       |
| `attributes`          | `[]`                              | Additional attributes (_e.g._ `1`)                                                       | No       |
| `tags`                | `{}`                              | Additional tags  (_e.g._ `map("BusinessUnit","XYZ")`                                     | No       |
| `delimiter`           | `-`                               | Delimiter to be used between `namespace`, `stage`, `name`, and `attributes`              | No       |
| `require_mfa`         | `false`                           | Require the users to have MFA enabled                                                    | No       |


## Outputs

| Name                | Description                            |
|:--------------------|:---------------------------------------|
| `group_name`        | The Group's name                       |
| `group_id`          | The Group's ID                         |
| `group_unique_id`   | Group's unique ID assigned by AWS      |
| `group_arn`         | The ARN assigned by AWS for the Group  |
| `policy_name`       | The name of the policy                 |
| `policy_id`         | The policy ID                          |



## Help

**Got a question?**

File a GitHub [issue](https://github.com/cloudposse/terraform-aws-organization-access-group/issues), send us an [email](mailto:hello@cloudposse.com) or reach out to us on [Gitter](https://gitter.im/cloudposse/).


## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/cloudposse/terraform-aws-organization-access-group/issues) to report any bugs or file feature requests.

### Developing

If you are interested in being a contributor and want to get involved in developing `terraform-aws-organization-access-group`, we would love to hear from you! Shoot us an [email](mailto:hello@cloudposse.com).

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull request** so that we can review your changes

**NOTE:** Be sure to merge the latest from "upstream" before making a pull request!


## License

[APACHE 2.0](LICENSE) © 2018 [Cloud Posse, LLC](https://cloudposse.com)

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.


## About

`terraform-aws-organization-access-group` is maintained and funded by [Cloud Posse, LLC][website].

![Cloud Posse](https://cloudposse.com/logo-300x69.png)


Like it? Please let us know at <hello@cloudposse.com>

We love [Open Source Software](https://github.com/cloudposse/)!

See [our other projects][community]
or [hire us][hire] to help build your next cloud platform.

  [website]: https://cloudposse.com/
  [community]: https://github.com/cloudposse/
  [hire]: https://cloudposse.com/contact/


### Contributors

| [![Erik Osterman][erik_img]][erik_web]<br/>[Erik Osterman][erik_web] | [![Andriy Knysh][andriy_img]][andriy_web]<br/>[Andriy Knysh][andriy_web] |
|-------------------------------------------------------|------------------------------------------------------------------|

  [erik_img]: http://s.gravatar.com/avatar/88c480d4f73b813904e00a5695a454cb?s=144
  [erik_web]: https://github.com/osterman/
  [andriy_img]: https://avatars0.githubusercontent.com/u/7356997?v=4&u=ed9ce1c9151d552d985bdf5546772e14ef7ab617&s=144
  [andriy_web]: https://github.com/aknysh/
