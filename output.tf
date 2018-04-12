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
  value = "${join("", coalescelist(aws_iam_group_policy.without_mfa.*.name, aws_iam_group_policy.with_mfa.*.name))}"
}

output "policy_id" {
  value = "${join("", coalescelist(aws_iam_group_policy.without_mfa.*.id, aws_iam_group_policy.with_mfa.*.id))}"
}
