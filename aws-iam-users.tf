# Users

## bzoidberg

resource "aws_iam_user" "bzoidberg" {
    name = "bzoidberg"
}

### Group Memberships

resource "aws_iam_user_group_membership" "bzoidberg" {
    user = "${aws_iam_user.bzoidberg.name}"
    groups = [
        "${aws_iam_group.SuperAdmin.name}"
    ]
}
