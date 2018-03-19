output "group_name" {
  value = "${aws_iam_group.default.name}"
}

output "group_id" {
  value = "${aws_iam_group.default.id}"
}

output "group_unique_id" {
  value = "${aws_iam_group.default.unique_id}"
}

output "group_arn" {
  value = "${aws_iam_group.default.arn}"
}

output "policy_name" {
  value = "${aws_iam_group_policy.default.name}"
}

output "policy_id" {
  value = "${aws_iam_group_policy.default.id}"
}
