resource "aws_organizations_organization" "mustermann_gmbh" {
  feature_set = "ALL"
}

resource "aws_organizations_account" "root_account" {
  name  = var.root_account_name
  email = var.root_account_email
}

resource "aws_organizations_account" "staging" {
  name  = var.staging_account_name
  email = var.staging_account_email
}

resource "aws_organizations_account" "production" {
  name  = var.production_account_name
  email = var.production_account_email
}
