# Solutions Architect Associate
> The first recommended certification

## Official Links

* [AWS Official - SAA-C02](https://aws.amazon.com/certification/certified-solutions-architect-associate/) 🆓 📖 - Official material from AWS
* [Well Architect Framework](https://aws.amazon.com/architecture/well-architected/) 🆓  📖 - Official framework to help guide decisions or answers depending on situations.

## Courses

* [A Cloud Guru - Course](https://acloud.guru/learn/aws-certified-solutions-architect-associate) 💰 📼 - The first one I have used to study - Personal opinion: good place to start but limited on technical details required for the test.
* [Linux Academy - Course](http://github.com/linuxacademy/content-aws-csa2019) 💰 📼 - Second one used to study - Much deeper and technically specified.
  * [Linux Academy - Code](https://github.com/linuxacademy/content-aws-csa2019) 🆓 💻 - Code
* [Alternative Free SAA-C02 Youtube Course](https://www.youtube.com/watch?v=Ia-UEYYR44s&feature=youtu.be) 🆓 📼 - 10 hours of free content to help you pass the exam

## Exam Simulations

* [800 Exam Questions](https://www.youtube.com/watch?v=pPCru6sKsZU&feature=youtu.be) 🆓 📼 - 800 SAA-C02 Exam Questions to Study

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
* `make import` - Import resources from AWS to Terraform. Usage: `RESOURCE="<component> <id>" make import`
* `make sqs_producer` - Start producing messages to the configured queue. Requires: `jot`, `uuidgen`, `aws-cli`, `jq`.
* `make sqs_consumer` - Start consuming messages from the configured queue. Requires: `jot`, `uuidgen`, `aws-cli`, `jq`.

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
* [10 - CLI](topics/10_CLI.md)
* [Databases  101](topics/11_DATABASES.md)
  * [11 - RDS](topics/11_DATABASES.md#rds)
    * [RedShift](topics/11_DATABASES.md#redshift)
    * [Aurora](topics/11_DATABASES.md#redshift)
  * [11 - DynamoDB](topics/11_DATABASES.md#dynamodb)
  * [11 - ElasticCache](topics/11_DATABASES.md#elastic-cache)
* DNS 101
  * [12 - Route53](topics/12_ROUTE53.md)
  * [Record Types](topics/12_ROUTE53.md#records)
  * [Routing Policies](topics/12_ROUTE53.md#routing-policies)
* [13 - VPC](topics/13_VPC.md)
  * [Building a VPC](topics/13_VPC.md#building-a-vpc)
  * [FlowLog](topics/13_VPC.md#flowlog)
  * [Bastion](topics/13_VPC.md#bastion)
  * [DirectConnect](topics/13_VPC.md#directconnect)
  * [GlobalAccelerator](topics/13_VPC.md#globalaccelerator)
  * [VPC Endpoint](topics/13_VPC.md#vpc-endpoint)
* High Availability
  * [14 - Load Balancers](topics/14_LOAD_BALANCERS.md)
    * [Theory](topics/14_LOAD_BALANCERS.md#theory)
    * [Practice](topics/14_LOAD_BALANCERS.md#lab)
    * [Sticky Sessions](topics/14_LOAD_BALANCERS.md#sticky-sessions)
    * [Cross-zone Load Balancing](topics/14_LOAD_BALANCERS.md#cross-zone-load-balancing)
    * [Sticky Sessions](topics/14_LOAD_BALANCERS.md#sticky-sessions)
  * [15 - AutoScaling](topics/15_AUTOSCALING.md)
    * [Components](topics/15_AUTOSCALING.md#components)
    * [Scaling Options](topics/15_AUTOSCALING.md#scaling-options)
* Components
  * [16 - SQS](topics/16_SQS.md)
    * [Scripts](topics/16_SQS.md#lab)
  * [17 - SWF](topics/17_SWF.md)
  * [18 - SNS](topics/18_SNS.md)
  * [19 - ElasticTranscoder](topics/19_ELASTIC_TRANSCODER.md)
  * [20 - API Gateway](topics/20_API_GATEWAY.md)
  * [21 - Kinesis](topics/21_KINESIS.md)
  * [22 - Cognito](topics/22_COGNITO.md)
  * [23 - Lambda](topics/23_LAMBDA.md)
* [24 - Migration](topics/24_MIGRATION.md)
* [25 - Cloud Best Practices](topics/25_CLOUD_BEST_PRACTICES.md)
* [26 - Well Architected Framework](topics/26_WELL_ARCHITECTED_FRAMWORK.md)
* [27 - Config](topics/27_CONFIG.md)
* [28 - SSO](topics/28_SSO.md)
* [30 - Questions](topics/30_QUESTIONS.md)
