provider "aws" {
  version = "~> 2.0"
  region  = "eu-central-1"
  shared_credentials_file = "../../shared/credentials"
}

resource "aws_iam_user" "first-user" {
  name = "first-user"
}
