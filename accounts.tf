# Main Account

resource "aws_organizations_account" "main" {
    name  = "Ber Zoidberg"
    email = "engineering@zoidplex.net"
}

# Dev

module "aws-account-dev" {
    source = "./aws-account"
    aws_account_name  = "dev"
    master_group_id   = "${aws_iam_group.SuperAdmin.id}"
}

# Prod
module "aws-account-prod" {
    source = "./aws-account"
    aws_account_name  = "prod"
    master_group_id   = "${aws_iam_group.SuperAdmin.id}"
}

# Personal

## Ber Zoidberg

module "aws-account-personal-bzoidberg" {
    source = "./aws-account"
    aws_account_name  = "bzoidberg"
    master_group_id = "${aws_iam_group.SuperAdmin.id}"
    email_prefix      = "ber"
}
