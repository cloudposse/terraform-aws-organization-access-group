module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.3.3"
  namespace  = "${var.namespace}"
  name       = "${var.name}"
  stage      = "${var.stage}"
  delimiter  = "${var.delimiter}"
  attributes = "${var.attributes}"
  tags       = "${var.tags}"
}

locals {
  enabled     = "${var.enabled == "true" ? true : false }"
  require_mfa = "${var.require_mfa == "true" ? true : false}"
}

# https://www.terraform.io/docs/providers/aws/r/iam_group.html
resource "aws_iam_group" "default" {
  count = "${local.enabled ? 1 : 0}"
  name  = "${module.label.id}"
}

# https://www.terraform.io/docs/providers/aws/r/iam_user_group_membership.html
resource "aws_iam_user_group_membership" "default" {
  count  = "${local.enabled && length(var.user_names) > 0 ? length(var.user_names) : 0}"
  user   = "${element(var.user_names, count.index)}"
  groups = ["${join("", aws_iam_group.default.*.id)}"]
}

# https://www.terraform.io/docs/providers/aws/d/iam_policy_document.html
data "aws_iam_policy_document" "with_mfa" {
  count = "${local.enabled && local.require_mfa ? 1 : 0}"

  statement {
    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "arn:aws:iam::${var.member_account_id}:role/${var.role_name}",
    ]

    condition {
      test     = "Bool"
      variable = "aws:MultiFactorAuthPresent"
      values   = ["true"]
    }

    effect = "Allow"
  }
}

resource "aws_iam_group_policy" "with_mfa" {
  count  = "${local.enabled && local.require_mfa ? 1 : 0}"
  name   = "${module.label.id}"
  group  = "${join("", aws_iam_group.default.*.id)}"
  policy = "${data.aws_iam_policy_document.with_mfa.json}"
}

data "aws_iam_policy_document" "without_mfa" {
  count = "${local.enabled && local.require_mfa == false ? 1 : 0}"

  statement {
    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "arn:aws:iam::${var.member_account_id}:role/${var.role_name}",
    ]

    effect = "Allow"
  }
}

resource "aws_iam_group_policy" "without_mfa" {
  count  = "${local.enabled && local.require_mfa == false ? 1 : 0}"
  name   = "${module.label.id}"
  group  = "${join("", aws_iam_group.default.*.id)}"
  policy = "${data.aws_iam_policy_document.without_mfa.json}"
}
