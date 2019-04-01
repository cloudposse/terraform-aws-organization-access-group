# Provision group access to data account
module "organization_access_group_data" {
  source      = "../"
  enabled     = "true"
  namespace   = "eg"
  stage       = "prod"
  name        = "chamber"
  user_names  = []
  require_mfa = "true"

  role_arns = {
    "cp@prod" = "arn:aws:iam::324440167066:role/OrganizationAccountAccessRole"
    "cp@dev"  = "arn:aws:iam::321110167044:role/OrganizationAccountAccessRole"
  }
}
