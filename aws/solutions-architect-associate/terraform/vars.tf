# Organization
variable "root_account_name" {}
variable "root_account_email" {}

variable "staging_account_name" {}
variable "staging_account_email" {}

variable "production_account_name" {}
variable "production_account_email" {}

# VPC
variable "vpc_id" {}

# VPC
variable "vpc_replica_id" {}

# Public SSH Key
variable "ec2_public_ssh_key" {}

# Main domain name
variable "main_domain" {}
