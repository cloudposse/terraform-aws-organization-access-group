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
  name = "${module.label.id}${var.delimiter}group"
}

# https://www.terraform.io/docs/providers/aws/r/iam_group_membership.html
resource "aws_iam_group_membership" "default" {
  name  = "${module.label.id}${var.delimiter}group${var.delimiter}membership"
  group = "${aws_iam_group.default.id}"
  users = ["${var.user_names}"]
}

# https://www.terraform.io/docs/providers/aws/d/iam_policy_document.html
data "aws_iam_policy_document" "default" {
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

# https://www.terraform.io/docs/providers/aws/r/iam_group_policy.html
resource "aws_iam_group_policy" "default" {
  name   = "${module.label.id}${var.delimiter}group${var.delimiter}policy"
  group  = "${aws_iam_group.default.id}"
  policy = "${data.aws_iam_policy_document.default.json}"
}
