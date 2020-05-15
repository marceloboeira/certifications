provider "aws" {
  version                 = "~> 2.0"
  region                  = "eu-central-1"
  shared_credentials_file = "../../shared/credentials"
}

resource "aws_iam_role" "s3_cross_account_role" {
  name = "s3-cross-account"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Condition": {},
      "Principal": {
        "AWS": "arn:aws:iam::${aws_organizations_account.staging.id}:root"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}
