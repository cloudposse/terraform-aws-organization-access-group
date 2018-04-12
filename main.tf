module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.3.3"
  namespace  = "${var.namespace}"
  name       = "${var.name}"
  stage      = "${var.stage}"
  delimiter  = "${var.delimiter}"
  attributes = "${var.attributes}"
  tags       = "${var.tags}"
}

# https://www.terraform.io/docs/providers/aws/r/iam_group.html
resource "aws_iam_group" "default" {
  name = "${module.label.id}"
}

# https://www.terraform.io/docs/providers/aws/r/iam_group_membership.html
resource "aws_iam_group_membership" "default" {
  name  = "${module.label.id}"
  group = "${aws_iam_group.default.id}"
  users = ["${var.user_names}"]
}

# https://www.terraform.io/docs/providers/aws/d/iam_policy_document.html
data "aws_iam_policy_document" "with_mfa" {
  count = "${var.require_mfa == "true" ? 1 : 0}"

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
  count  = "${var.require_mfa == "true" ? 1 : 0}"
  name   = "${module.label.id}"
  group  = "${aws_iam_group.default.id}"
  policy = "${data.aws_iam_policy_document.with_mfa.json}"
}

data "aws_iam_policy_document" "without_mfa" {
  count = "${var.require_mfa == "true" ? 0 : 1}"

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
  count  = "${var.require_mfa == "true" ? 0 : 1}"
  name   = "${module.label.id}"
  group  = "${aws_iam_group.default.id}"
  policy = "${data.aws_iam_policy_document.without_mfa.json}"
}
