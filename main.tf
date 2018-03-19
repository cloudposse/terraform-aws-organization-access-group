# https://www.terraform.io/docs/providers/aws/r/iam_group.html
resource "aws_iam_group" "default" {
  name = "${var.group_name}"
}

# https://www.terraform.io/docs/providers/aws/r/iam_group_membership.html
resource "aws_iam_group_membership" "default" {
  name  = "${var.group_name}"
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
  name   = "${var.policy_name}"
  group  = "${aws_iam_group.default.id}"
  policy = "${data.aws_iam_policy_document.default.json}"
}
