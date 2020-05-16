# Limited User
resource "aws_iam_user" "max_mustermann" {
  name = "max.mustermann"
}

# Admin User (equivalent to a root account permission)
resource "aws_iam_user" "erika_mustermann" {
  name = "erika.mustermann"
}

# Create Engineers Group
resource "aws_iam_group" "staff_engineers" {
  name = "staff-engineers"
}

# Assign Erika to the Staff Engineering Group
resource "aws_iam_user_group_membership" "erika_memberships" {
  user = aws_iam_user.erika_mustermann.name

  groups = [
    aws_iam_group.staff_engineers.name,
  ]
}

# Create Root Policy
resource "aws_iam_policy" "root" {
  name        = "root"
  description = "God mode"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

# Assign Root Policy to Staff Engineers
resource "aws_iam_policy_attachment" "root_assignment" {
  name = "root-assignment"
  groups = [
    aws_iam_group.staff_engineers.name,
  ]
  policy_arn = aws_iam_policy.root.arn
}

####### Roles #######

# Role to allow cross-account S3 access
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

# Policy to allow S3 actions
resource "aws_iam_role_policy" "s3_full_access" {
  name = "s3-full-access"
  role = aws_iam_role.s3_cross_account_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
