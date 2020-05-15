provider "aws" {
  version                 = "~> 2.0"
  region                  = "eu-central-1"
  shared_credentials_file = "../../shared/credentials"
}

##################### S3 #######################

resource "aws_iam_role" "s3_full_access" {
  name = "s3-full-access"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": "foo"
    }
  ]
}
EOF

  tags = {
    tag-key = "tag-value"
  }
}
