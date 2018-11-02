output "account-ids" {
    value = {
        main = "${aws_organizations_account.main.id}"
        dev  = "${module.aws-account-dev.account_id}"
        prod = "${module.aws-account-prod.account_id}"
        personal-bzoidberg = "${module.aws-account-personal-bzoidberg.account_id}"
    }
}
