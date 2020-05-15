resource "aws_organizations_organization" "mustermann_gmbh" {
  feature_set = "ALL"
}

resource "aws_organizations_account" "root_account" {
  name  = "marceloboeira-certification"
  email = var.root_account_email
}

resource "aws_organizations_account" "staging" {
  name  = "staging"
  email = var.staging_account_email
}

resource "aws_organizations_account" "production" {
  name  = "production"
  email = var.production_account_email
}
