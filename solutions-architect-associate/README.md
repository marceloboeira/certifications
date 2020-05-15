# Solutions Architect Associate
> The first recommended certification

# Official Links

* [SAA-C02](https://aws.amazon.com/certification/certified-solutions-architect-associate/)

## Getting Started

1. Create an AWS Account
2. Create Root Credentials (not the best practice, but convenient for learning. Once the first user is created you can use their credentials)
3. Setup the `shared/credentials` file based on the `.sample`
3. Setup the `secrets.tfvars` file based on the `.sample`
4. Run `make setup` to install Terraform plugins
5. Run `make plan` to check all the things to be created on your account
6. Run `make apply` to create and update the state

## Terraform Project

Within `terraform/` all terraform info is stored, the source, and the state. Not the ideal, but for this usecase of studying I didn't want to go over the setup of a complex state management, so, on any scenario feel free to delete the state file and re-create your own.

* `make setup` - Install plugins and dependencies.
* `make format` - Formats the Terraform code.
* `make plan` - Shows diff.
* `make apply` - Applies changes to AWS/State.

## Index

* [0 - Overview](topics/00_OVERVIEW.md)
* [1 - IAM 101](topics/01_IAM.md)
* [2 - S3 101](topics/02_S3.md)
* [3 - AWS Organizations & Billing](topics/03_ORGANIZATIONS_AND_BILLING.md)
