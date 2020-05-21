# Solutions Architect Associate
> The first recommended certification

# Official Links

* [A Cloud Guru - Course](https://acloud.guru/learn/aws-certified-solutions-architect-associate) - The one I have used to study 💰 📼
* [SAA-C02](https://aws.amazon.com/certification/certified-solutions-architect-associate/)

## Getting Started

1. Create an AWS Account
1. Create Root Credentials (not the best practice, but convenient for learning. Once the first user is created you can use their credentials)
1. Create a SSH key - [More info](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
1. Setup the `shared/credentials` file based on the `.sample`
1. Setup the `secrets.tfvars` file based on the `.sample` (use the public key created before)
1. Run `make setup` to install Terraform plugins
1. Run `make plan` to check all the things to be created on your account
1. Run `make apply` to create and update the state

## Terraform Project

Within `terraform/` all terraform info is stored, the source, and the state. Not the ideal, but for this usecase of studying I didn't want to go over the setup of a complex state management, so, on any scenario feel free to delete the state file and re-create your own.

* `make setup` - Install plugins and dependencies.
* `make format` - Formats the Terraform code.
* `make plan` - Shows diff.
* `make apply` - Applies changes to AWS/State.

## Index

* 10.000 foot overview
  * [0 - Overview](topics/00_OVERVIEW.md)
    * [Topics Covered In This Certification](topics/00_OVERVIEW.md#topics-covered-in-this-certification)
* Identity Access Management & S3
  * [1 - IAM 101](topics/01_IAM.md)
  * [2 - S3 101](topics/02_S3.md)
    * [What is S3?](topics/02_S3.md#what-is-s3?)
    * [Lifecycle Management Lab](topics/02_S3.md#lifecycle-management-lab)
    * [Cross-Region Replication](topics/02_S3.md#cross-region-replication)
    * [Transfer Acceleration](topics/02_S3.md#transfer-acceleration)
  * [3 - Organizations & Billing](topics/03_ORGANIZATIONS_AND_BILLING.md)
  * [4 - CloudFront](topics/04_CLOUD_FRONT.md)
  * [5 - Snowball](topics/05_SNOWBALL.md)
  * [6 - Storage Gateway](topics/06_STOAGE_GATEWAY.md)
  * [7 - Athena vs Macie](topics/07_ATHENA_VS_MACIE.md)
* EC2 101
  * [8 - EC2](topics/08_EC2.md)
    * [Security Groups](topics/08_EC2.md#security-groups-lab)
    * [EBS](topics/08_EC2.md#ebs)
    * [AMIs](topics/08_EC2.md#amis)
    * [ENI vs ENA vs EFA](topics/08_EC2.md#eni-vs-ena-vs-efa)
    * [EFS](topics/08_EC2.md#efs)
    * [FSx](topics/08_EC2.md#fsx)
    * [Placement Groups](topics/08_EC2.md#placement-groups)
    * [WAF](topics/08_EC2.md#waf)
  * [9 - Cloud Watch](topics/09_CLOUD_WATCH.md)
  * [10 - CLI & Scripting](topics/10_CLI.md)
