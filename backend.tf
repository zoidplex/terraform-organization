terraform {
  backend "s3" {
    bucket  = "zoidplex-terraform-state"
    key     = "terraform-organization/state"
  }
}

resource "aws_s3_bucket" "zoidplex-terraform-state" {
    bucket = "zoidplex-terraform-state"
    acl    = "private"
    versioning {
        enabled = true
    }
}
