# Groups

## SuperAdmin

resource "aws_iam_group" "SuperAdmin" {
    name = "SuperAdmin"
}

### Default Policies

resource "aws_iam_group_policy_attachment" "SuperAdmin-AdministratorAccess" {
  group = "${aws_iam_group.SuperAdmin.id}"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
