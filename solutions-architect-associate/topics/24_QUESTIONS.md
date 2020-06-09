## Questions

Some interesting questions worth mentioning it:

## IAM

1) When editing permissions (policies and ACLs), to whom does the concept of the "Owner" refer?
> The "Owner" refers to the identity and email address used to create the AWS account.

## EC2

1) When using EC2 instances with Dedicated Hosting, which of the following modes are you able to transition between by stopping the instance and starting it again?
> Dedicated & Host
> More info on [EC2 Tenancy](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-instance.html)

2) Which of the following features only relate to Spread Placement Groups?
> The placement group can only have 7 running instances per Availability Zone
> More info on [EC2 Placement](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html)

3) You purchased a reserved instance for hosting your website with a term of one year as this has significant cost savings compared to on-demand instances. What happens to this instance after one year?

* [ ] The reserved instance will renew automatically if the auto-renew option is set to true.
* [ ] The reserved instance will be shutdown automatically after one year and a 2 weeks of notice will be provided by AWS to either renew or terminate.
* [ ] The reserved instance will be terminated automatically after one year, with a termination warning notice.
* [x] The EC2 instance continues to run without interruption, but the instance is billed at the on-demand rate.
> Source: https://aws.amazon.com/premiumsupport/knowledge-center/reserved-instances-expire/

## Load Balancers

1) You are working for a security-conscious organisation that is about to deploy their first application in the cloud. This web-based application will need a load balancer in front of it, and due to the nature of the security posture of the organisation will need to be always available on the same (static) IP Address. Which load balancer configuration will deliver this outcome?
* [ ] A Network Load Balancer, with "UseEIP" set to "true" and an EIP assigned
* [ ] An Application Load Balancer in a public subnet
* [ ] An Application Load Balancer, with "UseEIP" set to "true" and an EIP assigned
* [x] A Network Load Balancer in a public subnet
* [ ] None - all load balancer IP will change over time - DNS needs to be used to find the IP
> [NLB](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/network-load-balancers.html) - "These Elastic IP addresses provide your load balancer with static IP addresses that will not change during the life of the load balancer"
> By default, any Application Load Balancer’s IP may change over time due to changes in AWS’s infrastructure. It is recommended to always use DNS to find the public IP. For this reason, an ALB alone is not suitable in this scenario. An NLB’s IP address on the other hand will not change and is, therefore, a better choice to meet this specific requirement. “UseEIP” is not a valid setting in either Load Balancer

2) A customer relationship management (CRM) application runs on Amazon EC2 instances in multiple Availability Zones behind an Application Load Balancer. If one of these instances fails, what occurs?
* [x] The load balancer will stop sending requests to the failed instance.
* [ ] The load balancer will terminate the failed instance.
* [ ] The load balancer will automatically replace the failed instance.
* [ ] The load balancer will return 504 Gateway Timeout errors until the instance is replaced.
> All LoadBalancers have the possibility to configure health-checks that set each instance state to either receive or not receive traffic. Only healthy instances do!

### EBS

1) What is the minimum size of an General Purpose SSD EBS Volume?
> 1GiB

## VPC

1) You have provisioned a custom VPC with a subnet that has a CIDR block of 10.0.3.0/28 address range. Inside this subnet, you have 2 web servers, 2 application servers, 2 database servers, and a NAT. You have configured an Autoscaling group on the two web servers to automatically scale when the CPU utilization goes above 90%. Several days later you notice that autoscaling is no longer deploying new instances into the subnet, despite the CPU utilization of all web servers being at 100%. Which of the following answers may offer an explanation?
* 10.0.3.0/28 gives you normally 16 addresses, but AWS reserves the first 4 and the last address, so you have 11 free. 7 are already in use, if the ASG needs to provision a couple machines it will run out of IP addresses. So:
* AWS reserves both the first four and the last IP address in each subnet's CIDR block.
* Your Autoscaling Group (ASG) has provisioned too many EC2 instances and has exhausted the number of internal IP addresses available in the subnet.
> More info on [AWS Subnet Create](https://docs.aws.amazon.com/cli/latest/reference/ec2/create-subnet.html)

2) You are hosting a web application that runs on a number of Web Servers in public subnets and Database Servers in private subnets. A NAT Instance is being used for connectivity to the internet for the Private Subnets. The NAT Instance is now becoming a bottleneck, and you are looking to replace it with NAT Gateway. Which of the following would ensure high availability for the NAT Gateway?
* [ ] Disable source/destination check on the NAT Instances
* [x] Deploy a NAT Gateway in 2 Availability Zones
* [ ] Deploy a NAT Gateway along with the NAT Instance
* [ ] Deploy a NAT Gateway in 2 Regions
> If you have resources in multiple Availability Zones and they share one NAT gateway, in the event that the NAT gateway’s Availability Zone is down, resources in the other Availability Zones lose internet access. To create an Availability Zone-independent architecture, create a NAT gateway in each Availability Zone and configure your routing to ensure that resources use the NAT gateway in the same Availability Zone.

## Databases

## RDS

1) You are auditing your RDS estate and you discover an RDS production database that is not encrypted at rest. This violates company policy and you need to rectify this immediately. What should you do to encrypt the database as quickly and as easy as possible.
* [ ] Use AWS Database Migration Service
* [ ] Use the RDS Import/Export Wizard to migrate the unencrypted RDS instance across to a new encrypted database.
* [x] Create a new DB Instance with encryption enabled and then manually migrate your data into it.
* [ ] Take a snapshot of your unencrypted DB Instance and then restore it making sure you select to encrypt the new instance.SELECTED
> At the present time, encrypting an existing DB Instance is not supported. To use Amazon RDS encryption for an existing database, create a new DB Instance with encryption enabled and migrate your data into it. Alternately you can encrypt a copy of a Snapshot and restore the encrypted copy. However you cannot encrypt as you are restoring from a snapshot. A key point is that an outage will be required either way.

2) As CloudWatch monitors RDS, it provides which of the following metrics by default? (Choose 2)
* [x] The number of current connections to the database
* [x] Memory available for use
* [ ] The number of transaction requests
* [ ] The number of users
> TODO: Add Source

## Aurora

1) A financial market dashboard needs to update asset values almost instantaneously for customers across the United States. Updates will be written to the primary application instance which resides in the AWS us-east-1 region. Which database architecture will provide the best performance for consumers of the dashboard's information?
* [ ] Implement Amazon Aurora MySQL with Aurora Replicas using cross-region physical replication. Create the replicas in the AWS us-east-2 and us-west-2 regions.
* [ ] Deploy Amazon Aurora MySQL with Aurora Replicas using cross-region logical replication. Create the replicas in the AWS us-east-2 and us-west-2 regions.
> Aurora Replica **physical replication can only replicate to one secondary region**
> More info on [Aurora Docs](https://aws.amazon.com/rds/aurora/faqs/)

2) As a Cloud Solutions Architect, you have been tasked to set up an enterprise-class database with six-way replication across three Availability Zones. This measure is proposed to strengthen the database's fault tolerance to disk failures. Which of the following engines will enable you to do that?
* [ ] Oracle
* [ ] MySQL
* [x] Amazon Aurora
* [ ] MariaDB
> Six-way replication is only available for Aurora

## DynamoDB

1) Which of the following strategies does AWS use to deliver the promised levels of DynamoDB performance?
> Data is partitioned in nodes, data is stored on SSD (faster random access)

2) You are a consultant planning to deploy DynamoDB across three AZs. Your lead DBA is concerned about data consistency. Which of the following do you advise the lead DBA to do?
> To ask the development team to code for strongly consistent reads. As the consultant, you will advise the CTO of the increased cost.
> More info:
>  - [Dynamo Read Consistency](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadConsistency.html)
>  - [Dynamo Read/Write Capacity](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadWriteCapacityMode.html)

3) At the monthly product meeting, one of the Product Owners proposes an idea to address an immediate shortcoming of the product system: storing a copy of the customer price schedule in the customer record in the database. You know that you can store large text or binary objects in DynamoDB. You give a tentative OK to do a Minimal Viable Product test, but stipulate that it must comply with the size limitation on the Attribute Name & Value. Which is the correct limitation?
> The combined Value and Name combined must not exceed 400 KB.
> More Info [Dynamo Limits](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html)

3) A football scoreboard app uses an AWS Lambda backend to retrieve game information stored in an Amazon DynamoDB database. An EC2 instance reads multiple Amazon Kinesis streams of scores and stats and writes them to the database. Two app users sitting side-by-side at a restaurant refresh the scoreboard at the same time and get different stats for the same game. What should the app developers do to resolve this?
> Have the Lambda function perform a strongly consistent read from the database
> Strongly consistent reads may have higher latency than eventually consistent reads, but they exist!
> More info on [Dynamo Consistency](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadConsistency.html)

## KMS

1) The marketing department at your company wants to run a Hadoop cluster on Amazon EMR to perform data mining on a 2 TB dataset. Your information security group requires that all data be encrypted in transit and at rest, both on-premises and in the cloud at all times. Encryption keys must be stored in the on-premises key management solution. You've decided to transmit the data to Amazon S3 using TLS. How will you protect the data at rest for processing by the EMR cluster?
> Since the key must be managed on permises you need to encrypt data on your client-side, by using KMS the keys would be managed by AWS.
> Use the AWS SDK for Java to implement the encryption materials provider interface in the EMRFS client. Retrieve the key from the on-premises key management system to decrypt the data stored in S3

## S3

1) Which of the following are valid S3 data encryption options?
> SSE-KMS, SSE-C, SSE-S3, Client Library on S3 Encryption Client
> [S3 Encryption](https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html)

2) You’re researching third-party backup solutions to backup 10 TB of data nightly to Amazon S3. File restores won’t be needed often, but when they are, they’ll need to be available in under five minutes. Your analysis shows that you will exceed your budget for backup storage and you need to find a way to reduce the estimated monthly costs. How should you modify the solution to achieve the cost reduction needed?
* [ ] Create an S3 lifecycle rule to move the data immediately to Amazon S3 Glacier
* [x] Choose a third-party backup solution that writes directly to the Amazon S3 Glacier API
* [ ] Choose a third-party backup solution that leverages AWS Storage Gateway to write data to Amazon S3 Glacier
* [ ] Write the data directly to the S3 Standard-Infrequent Access Storage ClassSELECTED
> Source: Q: What are Expedited retrievals?
> Expedited retrievals allow you to quickly access your data when occasional urgent requests for a subset of archives are required. For all but the largest archives (250MB+), data accessed using Expedited retrievals are typically made available within 1 – 5 minutes. There are two types of Expedited retrievals: On-Demand and Provisioned. On-Demand requests are fulfilled when we are able to complete the retrieval within 1 – 5 minutes. Provisioned requests ensure that retrieval capacity for Expedited retrievals is available when you need them.

3) You are about to encrypt the data in your S3 buckets, and you need a solution to enable the use of a customer master key (CMK) as an added layer of protection against unauthorized access. In addition, this solution must provide you with an audit trail that shows you when and who used the CMK. Which of the following choices denote this type of encryption?
* [ ] Server-Side Encryption
* [ ] Server-Side Encryption with Customer-Provided Keys (SSE-C)
* [ ] Server-Side Encryption with Amazon S3-Managed Keys (SSE-S3)
* [ ] Server-Side Encryption with AWS Key Management Service (SSE-KMS)

4) You've enabled website hosting on a bucket called 'aspiring-guru' in the us-west-2 Region. Which of the following is the URL that will be assigned to your website?
* [x] aspiring-guru.s3-website-us-west-2.amazonaws.com
* [ ] s3-website-us-west-2.aspiring-guru.amazonaws.com
* [ ] None of these
* [ ] s3-website.aspiring-guru-us-west-2.amazonaws.com
> Generally speaking, SSE is actually correct. However, the question is asking for a specific type of server-side encryption. SSE-S3 is another possible answer, since it encrypts the objects in the S3 buckets and Amazon S3 manages the encryption keys. However, the CMK and audit trail attributes are missing from this choice. With SSE-KMS, you get the CMK addition for added protection, as well as the audit trail, which is why SSE-KMS is the right answer. SSE-C is not the right choice because you, rather than Amazon, would manage the keys.

5) You are operating a popular TV Show news website using a static site generator (SSG) with the resulting HTML pages being served from S3. The vast majority of pages are less than 85 KB in size. After 60 days, new episode page access drops off significantly. Which of the following statements are true? (Choose 3)
* [x] Using the STANDARD_IA storage class, these older pages are stored redundantly across 3 or more geographically separated facilities.
* [x] The ONEZONE_IA storage class is as durable as STANDARD_IA, but it is less available and less resilient.
* [x] Using the STANDARD_IA storage class, Amazon S3 charges you for 128 KB per object if it is less than 128 KB in size.
* [ ] While objects in the STANDARD storage class are available for millisecond access, accessing STANDARD_IA objects is slightly slower.
> Similar to the STANDARD storage class, STANDARD_IA objects are available for millisecond access.
> ONEZONE_IA is durable as STANDARD_IA but less available and resilient (in case of a AZ failure)
> TODO: Add source

6) You have an application that allows people in very remote locations to store their files safely and securely. You need to leverage CloudFront's globally distributed Edge Locations, so that as data arrives at an Edge Location the data is routed to your Amazon S3 bucket over an optimized network path. Which of the following services should you use?
* [ ] S3 Multipart Upload
* [x] S3 Transfer Acceleration
* [ ] CloudFront Multipart Upload
* [ ] CloudFront Transfer Acceleration
> TODO: Source

## CloudFront

1) Your legal team has just identified a significant confidentiality breach in your web site and you have instructions to take all content down immediately. which of the following statements are correct. (Choose 2)
* [x] Only under certain circumstances will CloudFront invalidations be charged to your account.
* [x] Versioning object names can be used in place of invalidation if you set it up ahead of time.
* [ ] Invalidation are effective immediately on request.
* [ ] Invalidation requests can be cancelled if you issue the cancellation instruction in time.
* [ ] You cannot invalidate more that 3000 files in CloudFront at a time.
> Invalidation doesn't take effect immediately, cannot be cancelled and it doesn't have a limitation on number of files.

## Storage Gateway

1) Your on-premise servers are running low on disk storage space, but your company is not yet ready for a complete move to the public cloud. You've been tasked with finding an interim storage solution that also offers backup and archiving capabilities. Which AWS service would you recommend to meet this immediate need?
* [x] Storage Gateway with Gateway-Cached Volumes
* [ ] Storage Gateway with Gateway-Stored Volumes.
* [ ] Snowball
* [ ] DirectConnect
> More Info on [Storage Gateway UserGuide](https://docs.aws.amazon.com/storagegateway/latest/userguide/StorageGatewayConcepts.html)

2) A company currently stores data for on-premises applications on local drives. The chief technology officer wants to reduce hardware costs by storing the data in Amazon S3 but does not want to make modifications to the applications. To minimize latency, frequently accessed data should be available locally. What is a reliable and durable solution for a solutions architect to implement that will reduce the cost of local storage?
* [ ] Deploy an SFTP client on a local server and transfer data to Amazon S3 using AWS Transfer for SFTP.
* [x] Deploy an AWS Storage Gateway volume gateway configured in cached volume mode.
* [ ] Deploy an AWS DataSync agent on a local server and configure an S3 bucket as the destination.
* [ ] Deploy an AWS Storage Gateway volume gateway configured in stored volume mode.
> Storage Gateway volume gateway connects on on-premises software application with cloud-backed storage volumes. In cached volumes mode, all the data is stored in Amazon S3 and a copy of frequently accessed data is stored locally. More info on [What Is Storage Gateway](https://docs.aws.amazon.com/storagegateway/latest/userguide/WhatIsStorageGateway.html).

## SQS

1) A company needs to perform asynchronous processing, and has Amazon SQS as part of a decoupled architecture. The company wants to ensure that the number of empty responses from polling requests are kept to a minimum. What should a solutions architect do to ensure that empty responses are reduced?
* [ ] Increase the maximum message retention period for the queue.
* [ ] Increase the maximum receives for the redrive policy for the queue.
* [ ] Increase the default visibility timeout for the queue.
* [x] Increase the receive message wait time for the queue.
> The longer your consumer requests wait, the bigger is the change of getting a new message from the queue before another requests. Performing 10 requests in the same interval will only cost more.

## Scalability

1) Which of the following characterize a scalable and reliable solution on AWS? (Choose 2)
* [ ] A scalable solution applies elasticity at the expense of cost.
* [x] A scalable application will be resilient and operationally efficient
* [ ] A scalable solution applies elasticity, but is cost-agnostic.
* [x] A scalable solution will decrease in cost at scale.
> Scalable has to take operational cost into account, otherwise everything is scalable. e.g.: if you double your traffic you should not have more than double the cost, it must be min. linearly, but it should decrease at scale.

## Security

1) You are currently running an application in a production environment and you want to ensure that it is free of vulnerabilities. Which of the following AWS services would you use to accomplish this?
* [ ] AWS Web Application Firewall (WAF)
* [ ] AWS Trusted Inspector
* [x] Amazon Inspector
* [ ] AWS Shield
> WAF is a firewall tool, shield is a DoS prevention tool and Truested is for compliance, not for vulnerability scanning.
