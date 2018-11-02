resource "random_string" "env_id" {
  length = 8
  special = false
}

resource "aws_organizations_account" "account" {
    name  = "Zoidplex Engineering - ${var.aws_account_name}-${random_string.env_id.result}"
    email = "${var.email_prefix}+${var.aws_account_name}-${random_string.env_id.result}@${var.email_domain}"
    role_name = "SuperAdmin"
}

resource "aws_iam_group_policy" "SuperAdmin" {
  name  = "${var.aws_account_name}-${random_string.env_id.result}-SuperAdmin"
  group = "${var.master_group_id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "sts:AssumeRole",
    "Resource": "arn:aws:iam::${aws_organizations_account.account.id}:role/SuperAdmin"
  }
}
EOF
}

variable "aws_account_name" { type = "string" }

variable "master_group_id" { type = "string" }

variable "email_prefix" {
    type = "string"
    default = "engineering"
}

variable "email_domain" {
    type = "string"
    default = "zoidplex.net"
}
