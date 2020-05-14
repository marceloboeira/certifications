provider "aws" {
  version = "~> 2.0"
  region  = "eu-central-1"
  shared_credentials_file = "../../shared/credentials"
}

# TODO: Import Organization
# https://www.terraform.io/docs/providers/aws/r/organizations_organization.html
# https://www.terraform.io/docs/providers/aws/r/organizations_account.html

# Limited User
resource "aws_iam_user" "max-mustermann" {
  name = "max-mustermann"
}

# Admin User (equivalent to a root account permission)
resource "aws_iam_user" "erika-mustermann" {
  name = "erika-mustermann"

  # TODO
  #  Add global admin permission
}
