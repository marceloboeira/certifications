# Questions

Some interesting questions worth mentioning it:

## IAM / Organizations

1) When editing permissions (policies and ACLs), to whom does the concept of the "Owner" refer?
> The "Owner" refers to the identity and email address used to create the AWS account.

2) Which of these things is true about your AWS 'Root' account? (Choose 2)
* [x] You should keep a copy of the MFA URL or QR code when you set up the Root account MFA.
* [ ] There is no task that can only be done by the 'Root' account.
* [ ] If you forget you Root account password there is no way to reset it. You must contact AWS support for an identity check and backend reset.
* [x] The Root account cannot be denied access to resources by Policy.
> There are tasks that can only be done as root (e.g.: changing support plan), You can reset your root-account password by email.

3) You are deploying an application on to EC2 instances. The application must make AWS API calls. What is the most secure method to pass credentials to the application?
* [ ] Embed the API credentials in the application.
* [ ] Pass API credentials to the instance using userdata.
* [ ] Store the API credentials as an object in S3.
* [x] Assign an IAM role to the EC2 instances.
> All other options are somehow sharing credentials, which is unsafe.

4) What is the maximum amount of IAM users allowable per account?
* [ ] 2,000
* [ ] 4,000
* [x] 5,000
* [ ] 3,000
> [Source](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html)

5) Which option explains the difference between the two types of policies in an IAM Role?
* [ ] The trust policy allows identities to assume roles, while the permission policy defines the permissions provided.
* [ ] The trust policy establishes the permissions, while the permissions policy sets the eligible identities.
* [ ] Trust and permission policies provide access to IAM users.
* [ ] None of these answers provide the difference in the two types of policies in an IAM role.
> TODO

6) What is the max limit of access keys an IAM User may possess at a time?
* [ ] 4
* [ ] 6
* [ ] 1
* [x] 2
> [Source](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html)

7) What is the syntax for ARNs?
* [x] `arn:partition:service:region:account-id:`
* [ ] `arn:account-id:service:region:partition:`
* [ ] `arn:service:partition:region:account-id:`
* [ ] `arn:service:region:partition:account-id:`
> PSRA - Partition Service Region Account
> PS: AccountID and RegionID are omitted in some services, e.g.: arn:aws:s3:::my_corporate_bucket/*
> [More info](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)

8) Which service control policy allows access to all AWS services within an attached member account?
* [ ] AccountOrganizationAccessRole
* [ ] OrganizationAccountAccessRole
* [ ] AWSFullAccess
* [x] FullAWSAccess
> [Source](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_example-scps.html)

9) Which steps are needed for attaching a Service Control Policy (SCP) to an account within an Organizational Unit? (select all that apply)
* [x] Log in to the master account and create the SCP
* [x] Attach the SCP to the member account within the Organizational Unit
* [x] Enable the SCP for the Organizational Unit
* [x] Select the Organizational Unit
* [ ] All of these answers are correct
* [ ] Logging into the member account
> TODO

10) Which are benefits of using AWS Organizations?
* [ ] Two master accounts can control member accounts.
* [x] Reserved purchases can be used by member accounts.
* [x] Consolidated billing
* [x] Reduced admin overhead
> [More info](https://aws.amazon.com/organizations/).

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
> [Source](https://aws.amazon.com/premiumsupport/knowledge-center/reserved-instances-expire/)

4) A solutions architect wants to design a solution to save costs for Amazon EC2 instances that do not need to run during a 2-week company shutdown. The applications running on the instances store data in instance memory (RAM) that must be present when the instances resume operation. Which approach should the solutions architect recommend to shut down and resume the instances?
* [ ] Modify the application to store the data on instance store volumes. Reattach the volumes while restarting them.
* [ ] Snapshot the instances before stopping them. Restore the snapshot after restarting the instances.
* [x] Run the applications on instances enabled for hibernation. Hibernate the instances before the shutdown.
* [ ] Note the Availability Zone for each instance before stopping it. Restart the instances in the same Availability Zones after the shutdown.
> Source: [EC2 Hibernation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Hibernate.html).

5) Select the most correct answer: The device name /dev/sda1 (within Amazon EC2 ) is:
* [ ] Recommended for instance store volumes
* [ ] Possible for EBS volumes
* [ ] Recommended for EBS volumes
* [x] Reserved for the root device
> Source: [EC2 Device Naming](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/device_naming.html)

6) You have developed a new web application in us-west-2 that requires six Amazon Elastic Compute Cloud (EC2) instances running at all times. You have three availability zones available in that region (us-west-2a, us-west-2b, and us-west-2c). You need 100 percent fault tolerance if any single Availability Zone in us-west-2 becomes unavailable. How would you do this, each answer has 2 answers, select the answer with BOTH correct answers.
* [ ] Answer 1 - Us-west-2a with two EC2 instances, us-west-2b with two EC2 instances, and us-west-2c with two EC2 instances. Answer 2 - Us-west-2a with six EC2 instances, us-west-2b with six EC2 instances, and us-west-2c with no EC2 instances
* [x] Answer 1 - Us-west-2a with six EC2 instances, us-west-2b with six EC2 instances, and us-west-2c with no EC2 instances. Answer 2 - Us-west-2a with three EC2 instances, us-west-2b with three EC2 instances, and us-west-2c with three EC2 instances.
* [ ] Answer 1 - Us-west-2a with three EC2 instances, us-west-2b with three EC2 instances, and us-west-2c with no EC2 instances. Answer 2 - Us-west-2a with three EC2 instances, us-west-2b with three EC2 instances, and us-west-2c with three EC2 instances.
* [ ] Answer 1 - Us-west-2a with three EC2 instances, us-west-2b with three EC2 instances, and us-west-2c with three EC2 instances. Answer 2 - Us-west-2a with four EC2 instances, us-west-2b with two EC2 instances, and us-west-2c with two EC2 instances.
> The only option that makes sense is 6-6-0, 3-3-3 since all the others do not add up to 6 in the case of an AZ failure.

7) When reviewing Auto Scaling events, it is noticed that an application is scaling up and down multiple times per hour. What design change could you make to optimize cost while preserving elasticity?
* [ ] Change the Launch Configuration to use a larger instance type.
* [ ] Add a Provisioned IOPS volume to the instance.
* [ ] Increase the number of instances in the Auto Scaling group.
* [x] Change the scale-down CloudWatch metric to a higher threshold.
> Modifying your scaling threshold is preferable to altering your number of instances manually.

8) Which of the following are types of virtualization available on AWS?
* [x] Hardware Virtual Machine (HVM)
* [x] Paravirtual Machine (PV)
* [ ] Cloud Virtual Machine (CVM)
* [ ] Physical Virtual Machine (PVM)
> The two different types of virtualization available are Hardware Virtual Machine (HVM) & Paravirtual Machine (PVM)

9) You are about to delete the second snapshot of an EBS volume which had 10 GiB of data at the time when the very first snapshot was taken. 6 GiB of that data has changed before the second snapshot was created. An additional 2 GiB of data have been added before the third and final snapshot was taken. Which of the following statements about that is correct?
* [ ] After deletion, the total storage required for the two remaining snapshots is 12 GiB; 10 GiB for the first and 2 GiB for the last snapshot.
* [x] Before deletion, the total storage required for the three snapshots was 18 GiB of which the second one had 6 GiB of data. After the deletion of that second snapshot, you are still charged for storing 18 GiB of data - 10 GiB from the very first snapshot and 8 GiB (6 + 2) of data from the last snapshot.
* [ ] Each EBS volume snapshot is a full backup of the complete data and independent of other snapshots. You can go ahead and delete the second snapshot to save costs. After that, you are charged for only 22 GiB of data for the two remaining snapshots.
* [ ] Snapshots are incremental backups, which means that only the blocks on the device that have changed after your most recent snapshot are saved. Therefore, you can only delete them in reverse chronological order, i.e. starting with the third snapshot and then the second one.
> Textbook, more info on [EBSSnapshots](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html).
> When you delete a snapshot, only the data unique to that snapshot is removed. Each snapshot contains or references all of the information needed to restore your data (from the moment when the snapshot was taken) to a new EBS volume.

10) An organization is looking to re-use an existing unused EC2 instance, load it with required application components and hibernate it, so that an application can be made available quickly whenever required. Can hibernation be enabled on an existing instance?
* [ ] A running instance can be made standby by enabling hibernation in the instance details properties pane
* [ ] The running instance should be stopped before enabling hibernation
* [ ] Hibernation is part of EC2 auto-scaling and cannot be enabled at instance level
* [x] Hibernation can be enabled only at instance launch and cannot be enabled on an existing instance (running or stopped)
> "You can enable and use hibernation on **freshly launched instances** of the types that I listed above." [EC2 Hibernate Release Post](https://aws.amazon.com/blogs/aws/new-hibernate-your-ec2-instances/).

11) You have a application that is running in an EC2 instance that performs some heavy processing on sales data stored in S3. This sales data is first loaded into memory and numerous operations are performed on it before it is written back to S3. During the processing phase, a large amount of temporary data is created which is not needed once processing completes. This data needs to be stored on as low-latency storage as possible - which of the below storage types should you use?
* [ ] S3 Intelligent Tiering
* [x] Instance Store
* [ ] Provisioned IOPS SSD
* [ ] EBS
> All options work well, but for the lower latency Instance Store is the way to go.
> [Instance Store Page](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html) - "This is a good option when you need storage with very low latency, but you don't need the data to persist when the instance terminates or you can take advantage of fault-tolerant architectures".

12) Which of the following is true with regards to a private IP address of an EC2 instance?
* [x] A secondary private IPv4 address can be reassigned from the primary network interface to another network interface
* [ ] A secondary private IPv4 address cannot be detached or reassigned from the primary network interface to another network interface
* [x] Private IP address remains associated with the Network Interface when the instance is stopped and restarted, and is released when the instance is terminated
* [ ] Private IP address remains associated with the Network Interface when the instance is restarted, and is released when the instance is stopped or terminated
> Multiple IP addresses (IPv4 or IPv6) can be specified for an Instance depending upon Instance Types. Multiple IP addresses can be assigned and unassigned to network interfaces attached to running or stopped instances. An instance receives a static private IPv4 address from the address range within a VPC. Private IP address remains associated with the Network Interface when the instance is stopped and restarted, and is released when the instance is terminated. A secondary private IPv4 address can be assigned to any network interface. The network interface need not be attached to the instance. A secondary private IPv4 address that is assigned to a network interface can be reassigned to another one if you explicitly allow it. Although the primary network interface cannot be detached from an instance, the secondary private IPv4 address of the primary network interface can be reassigned to another network interface.

13) What is the minimum size of an General Purpose SSD EBS Volume?
> 1GiB

14) An Amazon EC2 instance is part of an Amazon EC2 Auto Scaling group. You want to reboot an instance without Amazon EC2 Auto Scaling terminating it due to a health check failure. What are the suitable options available to reboot an instance in an Auto Scaling group in such circumstances? (Choose 3)
* [x] Suspend the health check process temporarily and after reboot resume the suspended process
* [ ] Detach the instance from the group, reboot the instance and reattach the instance to the Auto Scaling group
* [ ] Delete the Auto Scaling Groups and then restart the instances as they are not part of any Auto Scaling group
* [ ] Delete the CloudWatch Logs from where the health check status is collected
* [ ] Put the instance into the Standby state, reboot the instance and return the instance to service in the Auto Scaling group
> Source [Rebooting Scaling Group Instance](https://aws.amazon.com/premiumsupport/knowledge-center/reboot-autoscaling-group-instance/).

15) Your three AWS accounts (A, B and C) share data. In an attempt to maximize performance between the accounts, you place all the instances for these accounts in 'eu-west-1b'. During testing, you find almost no transfer latency between accounts A and B, but significant latency between accounts B and C, and accounts C and A. Which of the following possibilities is the most likely explanation of the problem?
* [ ] You have incorrectly configured the cross-account authentication policies in account C, which contributes to the latency between those instances.
* [ ] Account C has been allocated to an older section of the data center with slower networking.
* [ ] The instances for account C are on an overloaded host. Stop all the Account C instances and then start them together so that they run an a new host.
* [x] Availability Zones consist of one or more discrete data centers; as such, 'eu-west-1b' is not necessarily the same physical location for all three accounts. This explains the latency.
> As the option says, AZ-ids resolve to different zones on each account - More info on [AZ IDs](https://docs.aws.amazon.com/ram/latest/userguide/working-with-az-ids.html).

16) You are designing infrastructure for a data analysis application. One of the volumes will host a small temporary data base and require high IOPS. What storage should you suggest?
* [ ] S3
* [ ] EFS
* [ ] EBS Volume
* [x] Instance Store
> Instance Store is great for ephemeral storage or temporary storage and can handle performance over 80,000 IOPs

17) You have created a GP2 EBS volume in AWS. It is 1 TiB in size. What level of sustained IOPS should it deliver?
* [ ] 300
* [ ] 10,000
* [x] 3,000
* [ ] 1,000
> GP2 delivers 3 IOPS per GiB - volume of 1 TiB (1,000 GiB) would deliver 3,000 IOPS - [More info](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html)

18) You have launched 5 EC2 instances of the same size into a cluster placement group. You attempt to launch 5 more and get an error. What are you seeing this error and how can you resolve this issue?
* [ ] Make sure you are launching your instances into different AZs
* [x] Terminate these instances and relaunch 10 at the same time into the same placement group
* [x] Use the same type and same size of instances
* [ ] Try launching 12 instances instead
> The instances must be the same size and launched at the same time. If you try to add more instances to the placement group later, or if you try to launch more than one instance type in the placement group, you increase your chances of getting an insufficient capacity error. [More info](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html).

19) You have been asked to design modifications to an existing application deployed into EC2 using an Auto Scaling group. Your client needs to make sure data can be obtained from EC2 instances for compliance reasons. They need CPU usage, network data transfer levels, and memory available. What should you tell them?

* [ ] Data can be accessed using CloudWatch, but for memory available usage, CloudWatch Logs should be used.
* [ ] The data is accessible by default using CloudWatch.
* [x] The data is accessible using CloudWatch if the agent is installed.
* [ ] The data is accessible using CloudWatch, but detailed monitoring needs to be enabled
> Detailed monitoring doesn't add metrics — it just increases the level of detail for existing metrics. To capture the process memory available usage, the agent is required. [Source](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/metrics-collected-by-CloudWatch-agent.html).
>  By default CloudWatch doens't have access to memory usage for privacy reasons. However, with the CloudWatch agent allows for many more internal metrics to be gathered and is required in this case for the memory available usage. [Source]( https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/metrics-collected-by-CloudWatch-agent.html).

20) Promotional Campaign Starting in 2 weeks, management wants to ensure no problems to scale traffic. What should be done to AutoScaling to fulfill this requirement?

* [ ] Configure Step scaling for the ASG
* [x] Configure Dynamic Scaling and use Target Tracking Scaling Policy
* [ ] Configure Scheduled Scaling for the ASG
* [ ] Configure Static scaling for the ASG
> Dynamic Scaling and Target Tracking Scaling Policy are the way to go, since a scheduled scaling might be limited to an expected amount of traffic only.

## ELB

1) You are working for a security-conscious organisation that is about to deploy their first application in the cloud. This web-based application will need a load balancer in front of it, and due to the nature of the security posture of the organisation will need to be always available on the same (static) IP Address. Which load balancer configuration will deliver this outcome?
* [ ] A Network Load Balancer, with "UseEIP" set to "true" and an EIP assigned
* [ ] An Application Load Balancer in a public subnet
* [ ] An Application Load Balancer, with "UseEIP" set to "true" and an EIP assigned
* [x] A Network Load Balancer in a public subnet
* [ ] None - all load balancer IP will change over time - DNS needs to be used to find the IP
> [NLB](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/network-load-balancers.html) - "These Elastic IP addresses provide your load balancer with static IP addresses that will not change during the life of the load balancer"
> By default, any Application Load Balancerss IP may change over time due to changes in AWS's infrastructure. It is recommended to always use DNS to find the public IP. For this reason, an ALB alone is not suitable in this scenario. An NLB's IP address on the other hand will not change and is, therefore, a better choice to meet this specific requirement. UseEIP is not a valid setting in either Load Balancer

2) A customer relationship management (CRM) application runs on Amazon EC2 instances in multiple Availability Zones behind an Application Load Balancer. If one of these instances fails, what occurs?
* [x] The load balancer will stop sending requests to the failed instance.
* [ ] The load balancer will terminate the failed instance.
* [ ] The load balancer will automatically replace the failed instance.
* [ ] The load balancer will return 504 Gateway Timeout errors until the instance is replaced.
> All LoadBalancers have the possibility to configure health-checks that set each instance state to either receive or not receive traffic. Only healthy instances do!

3) If you deploy an ELB-Classic as part of your VPC web app which is true (Choose 3)
* [x] The inward facing interface supports IPv4 addressing
* [ ] AWS publishes a Dual-stack (both IPv4 and IPv6) DNS name on R53
* [x] The outward facing interface supports IPv4 addressing
* [x] The Listener can be set up to distribute 'Apache Derby Network Server'(1527) connections
* [ ] The inward facing interface supports IPv6 addressing
* [ ] The outward facing interface supports IPv6 addressing
> An ELB-Classic Load Balancer in an EC2-Classic (Legacy, nonVPC) environment it can have an associated IPv4, IPv6, and dual-stack (both IPv4 and IPv6) DNS name, and supports IPv6 on the External/public interface. However inside a VPC IPv6 is not supported on the external or internal interface(s).
>  Internet-facing Classic Load Balancers (formerly Elastic Load Balancer (ELB)) is IPv4-only when used in a VPC. Classic Load Balancers can use IPv6, depending on the DNS name you use, but only if they are used in EC2-Classic mode (rare these days). https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-internet-facing-load-balancers.html

4) You have a fleet of 10 EC2 instances split across two availability zones, provisioned by an auto-scaling-group and using an application load balancer. The instances ALB is using EC2 status checks and all instances are currently passing 2/2 checks - but some are showing application failures and the instances are not being re-provisioned. What could the problem be?
* [x] ELB health checks are not being used by the Auto Scaling Group
* [ ] You forgot to enable Detailed Monitoring
* [ ] Your security group does not have the correct allow rule
* [ ] Some of your instances are not in the same AZ
> EC2 health checks should be shared with your ASG, so that way your ASG will know the status of your EC2 instances.

5) You are consulting for a web hosting company that runs hundreds of WordPress deployments. Each WordPress deployment generally runs on one EC2 instance and is part of an Auto Scaling group with min 1, max 1, and desired 1. Each environment is using a Classic Load Balancer to provide self-healing capability. SSL certificates are also used. The business has asked you to suggest improvements that could reduce costs.  What should you suggest?
* [ ] Use Network Load Balancers instead of Classic Load Balancers.
* [ ] Migrate all SSL certificates onto a single Classic Load Balancer using SNI.
* [ ] Snapshot the EC2 instances and migrate each to an Elastic Beanstalk application.
* [x] Migrate the Classic Load Balancers to Application Load Balancers.
> Classic ELB doesn't support SNI, so migrating to ALB (with SNI) will help. The catch is that SNI is the solution but the last option doesn't mention it explicitly.
> [More info](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-https-load-balancers.html).

## VPC

1) You have provisioned a custom VPC with a subnet that has a CIDR block of 10.0.3.0/28 address range. Inside this subnet, you have 2 web servers, 2 application servers, 2 database servers, and a NAT. You have configured an Autoscaling group on the two web servers to automatically scale when the CPU utilization goes above 90%. Several days later you notice that autoscaling is no longer deploying new instances into the subnet, despite the CPU utilization of all web servers being at 100%. Which of the following answers may offer an explanation?
* [x] Your Autoscaling Group (ASG) has provisioned too many EC2 instances and has exhausted the number of internal IP addresses available in the subnet.
> 10.0.3.0/28 gives you normally 16 addresses, but AWS reserves the first 4 and the last address, so you have 11 free. 7 are already in use, if the ASG needs to provision a couple machines it will run out of IP addresses. So: AWS reserves both the first four and the last IP address in each subnet's CIDR block.
> More info on [AWS Subnet Create](https://docs.aws.amazon.com/cli/latest/reference/ec2/create-subnet.html)

2) You are hosting a web application that runs on a number of Web Servers in public subnets and Database Servers in private subnets. A NAT Instance is being used for connectivity to the internet for the Private Subnets. The NAT Instance is now becoming a bottleneck, and you are looking to replace it with NAT Gateway. Which of the following would ensure high availability for the NAT Gateway?
* [ ] Disable source/destination check on the NAT Instances
* [x] Deploy a NAT Gateway in 2 Availability Zones
* [ ] Deploy a NAT Gateway along with the NAT Instance
* [ ] Deploy a NAT Gateway in 2 Regions
> If you have resources in multiple Availability Zones and they share one NAT gateway, in the event that the NAT gateway's Availability Zone is down, resources in the other Availability Zones lose internet access. To create an Availability Zone-independent architecture, create a NAT gateway in each Availability Zone and configure your routing to ensure that resources use the NAT gateway in the same Availability Zone.

3) A Solution Architect is designing a three-tier web application. The Architect wants to restrict access to the database tier to accept traffic from the application servers only. However, these application servers are in an Auto Scaling group and may vary in quantity. How should the Architect configure the database servers to meet the requirements?
* [ ] Configure the database subnet network ACL to deny all inbound non-database traffic from the application-tier subnet.
* [ ] Configure the database subnet network ACL to allow inbound database traffic from the application-tier subnet.
* [x] Configure the database security group to allow database traffic from the application server security group.
* [ ] Configure the database security group to allow database traffic from the application server IP addresses.
> ACL needs to open inbound and outbound traffic for specific subnets, IPs

4) A Solutions Architect is designing a VPC. Instances in a private subnet must be able to establish IPv6 traffic to the Internet. The design must scale automatically and not incur any additional cost. This can be accomplished with:
* [ ] a VPC endpoint
* [ ] a custom NAT instance
* [x] an egress-only internet gateway
* [ ] a NAT gateway
> Egress-only internet gateways are IPv6 whereas NAT devices do not support IPV6, only v4. [Source](https://medium.com/awesome-cloud/aws-vpc-egress-only-internet-gateway-overview-intro-getting-started-guide-2db86d43c7c7).

5) A Solutions Architect has been given the following requirements for a company's VPC:
The solution is a two-tiered application with a web tier and a database tier. All web traffic to the environment must be directed from the Internet to an Application Load Balancer. The web servers and the databases should not obtain public IP addresses or be directly accessible from the public Internet. Because of security requirements, databases may not share a route table or subnet with any other service. The environment must be highly available within the same VPC for all services. What is the minimum number of subnets that the Solutions Architect will need based on these requirements and best practices?
* [ ] 3
* [ ] 2
* [x] 6
* [ ] 4
> You'll need at lest 2 subnets (one for the WS another for the DB) for each AZ, counting 3 AZs for high-availability then you have 6

6) You have an EC2 Instance with an EIP allocated sitting in a Public subnet in your VPC. This instance is serving web content, and you want to make sure that users on the Internet can only access it via ports 80 and 443. Which of the below options lets you achieve this?
* [ ] Create a security group with an ALLOW rule for ports 80 & 443, and a DENY Rule for all other ports. Attach it to the instance
* [ ] Create an NACL with a default allow rule on incoming traffic. Create a security group with a DENY rule for all ports except 80 & 443 and attach it to the instance.
* [ ] Create and NACL with a default deny rule on incoming traffic. Create a security group with an ALLOW rule for ports 80 & 443 and attach it to the instance.
* [x] Create a security group with an ALLOW rule for ports 80 & 443 and attach it to the instance
> Security groups are in/outbound, NACL only incoming is not enough

7) Which of the following is an invalid VPC peering configuration?
* [ ] You have peered three VPCs in a full-mesh configuration. The VPCs are in the same AWS account and do not overlapping CIDR blocks.
* [ ] You have a VPC peering connection between VPCs A and B. They are in the same AWS account, and they do not have overlapping CIDR blocks.
* [ ] VPC A has peering connections to VPCs B and C. All three VPCs are in the same AWS account, and there are no overlapping CIDR blocks.
* [x] You have a VPC peering connection between VPC A and VPC B. VPC A also has a VPN connection to a corporate network. You use VPC A to extend the peering relationship to exist between VPC B and the corporate network so that traffic from the corporate network can directly access VPC B by using the VPN connection to VPC A.
> Edge-to-edge routing is not allowed through a VPN connection.

8) You have some EC2 instances in a private subnet that need access to an S3 bucket. There is a requirement that traffic does not traverse the Internet. Which of the following can be used to achieve this?
* [ ] NAT Gateway
* [ ] NAT Instance
* [ ] Internet Gateway
* [x] VPC Gateway Endpoint
> Gateway Endpoint gives you access to internal URLs for S3 and similar services, resolving directly to AWS internal network (not reaching out to the internet).

9) Which of the below a valid sources or destinations for a VPC Security Group?
* [ ] An IAM Role
* [x] A different security group
* [x] A range of IPv4 Addresses
* [x] The prefix list ID for an AWS service
* [ ] An EC2 Instance
* [ ] An S3 Bucket
> Source [Security Group List](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html).

10) You work for a construction company that has their production environment in AWS. The production environment consists of 3 identical web servers that are launched from a standard Amazon Linux AMI using Auto Scaling. The web servers are launched in to the same public subnet and belong to the same security group. They also sit behind the same ELB. You decide to do some testing: you launch a 4th EC2 instance into the same subnet and same security group. Annoyingly, your 4th instance does not appear to have internet connectivity. What could be the cause of this?
* [ ] You have not configured a NAT in the public subnet.
* [x] You have not assigned an elastic IP address to this instance.
* [ ] You need to update your route table so as to provide a route out for this instance.
* [ ] You have not configured a routable IP address in the host OS of the fourth instance.
> Of these choices, the absence of the Elastic IP is the only one that could prevent internet access. More info on [ElasticIPs](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-eips.html).

11) A large jewelry distributor has installed their new inventory application in a development environment on AWS. After completing their testing, they're ready to deploy the application into its production environment. They've been using VPN connections for the development phase, but they need to upgrade to a higher resiliency network connection scheme to communicate back and forth from other on-premises business applications that are mirrored across two data centers. Testing results indicate that some transactions may require more than a 1.25 Gbps connection to ensure a quality customer experience. Which network architecture will provide the appropriate resiliency for this inventory application?
* [ ] Configure two AWS Direct Connect connections to an AWS Direct Connect location from two different network devices in one data center.
* [ ] Implement an AWS Direct Connect connection from one data center to an AWS Direct Connect location. Establish a VPN connection from the other data center as a backup.
* [ ] Install two AWS Direct Connect connections to an AWS Direct Connect location from two different network devices in one data center. Create another two AWS Direct Connect connections to a different AWS Direct Connect location from two different network devices in the other data center.
* [x] Create an AWS Direct Connect connection from one data center to an AWS Direct Connect location. Install another AWS Direct Connect connection from the other data center to a different AWS Direct Connect location.
> For critical production workloads like an inventory application that require high resiliency, it is recommended to have one connection at multiple locations. Such a topology ensures resilience to connectivity failure due to a fiber cut or a device failure as well as a complete location failure. Use of a Direct Connect Gateway will provide access to any AWS Region from any Direct Connect location. Installing separate connections terminating on separate devices in more than one location gives another layer of resiliency, but that configuration, along with its added costs, is not necessary for this use case. Creating separate connections to only a single Direct Connect location from a single data center does not mitigate the risk of full facility outages. AWS doesn't recommend using a VPN as a backup for connections that require speeds greater than 1 Gbps.

12) You work for a famous bakery who are deploying a hybrid cloud approach. Their legacy IBM AS400 servers will remain on premise within their own data center. However, they will need to be able to communicate to the AWS environment over a site-to-site VPN connection. What do you need to do to establish the VPN connection?
* [x] Assign a public IP address to your Amazon Virtual Private Gateway.
* [ ] Update your route table to add a route for the NAT to 0.0.0.0/0.
* [ ] Connect to the environment using AWS Direct Connect.
* [ ] Create a dedicated NAT and deploy this to the public subnet.
> A virtual private gateway is the VPN concentrator on the Amazon side of the VPN connection. You create a virtual private gateway and attach it to the VPC from which you want to create the VPN connection.

13) To establish a successful site-to-site VPN connection from your on-premise network to an AWS Virtual Private Cloud, which of the following must be configured?
* [ ] A private subnet in your VPC
* [ ] A NAT instance
* [x] A Virtual Private Gateway
* [x] A VPC with Hardware VPN Access
* [x] An on-premise Customer Gateway
> You must have a VPC with Hardware VPN Access, an on-premise Customer Gateway, and a Virtual Private Gateway to make the VPN connection work.

14) You have a multi-tier application with each tier in a separate subnet. The application server is in Subnet1 which needs to connect with a MySQL RDS DB instance in Subnet2. Each subnet has its own NACL: NACL1 (Subnet1), NACL2 (Subnet2). How should these NACLs be configured to allow communication between your app servers and the back-end database in the most secure fashion?
* [x] NACL1 - Inbound: Allow Ephemeral Ports 1024 - 65535 From Subnet2 CIDR NACL1 - Outbound: Allow MySQL Port 3306 To Subnet2 CIDR NACL2 - Inbound: Allow MySQL Port 3306 From Subnet1 CIDR NACL2 - Outbound: Allow Ephemeral Ports 1024 - 65535 To Subnet1 CIDR
* [ ] NACL1 - Inbound: Allow MySQL Port 3306 From Subnet2 CIDR NACL1 - Outbound: Allow Ephemeral Ports 1024 - 65535 To Subnet2 CIDR NACL2 - Inbound: Allow Ephemeral Ports 1024 - 65535 From Subnet1 CIDR NACL2 - Outbound: Allow MySQL Port 3306 To Subnet1 CIDR
* [ ] NACL1 - Inbound: Allow MySQL Port 3306 From Subnet2 CIDR NACL2 - Outbound: Allow MySQL Port 3306 To Subnet1 CIDR
* [ ] NACL1 - Outbound: Allow MySQL Port 3306 To Subnet2 CIDR NACL2 - Inbound: Allow MySQL Port 3306 From Subnet1 CIDR
> Since NACLs are stateless, you need to define the connectivity rules for both Inbound and Outbound traffic. Since the EC2 Application server initiates the connection to the DB server an Outbound rule is required on MySQL Port to Subnet2, and an Inbound rule is required on the ephemeral ports (1024 - 65535) to accommodate the response traffic. The reverse settings are then required for the NACL assigned to the DB subnet. Entries that do not have inbound and outbound rules defined in each NACL are incorrect and the other answer would fail as it assumes the connection is established by the DB instance.

14) Which of the following are TRUE statements when considering VPC Peering? (Choose 2)
* [x] If VPC A is peered to VPC B, and VPC B is peered to VPC C, VPC A will NOT be able to communicate to VPC C through VPC B
* [x] IP Addresses in peered VPCs cannot overlap
* [ ] IP Addresses in peered VPCs can overlap with a NAT Instance used in the middle
* [ ] If VPC A is peered to VPC B, and VPC B is peered to VPC C, VPC A will be able to communicate to VPC C through VPC B
> IP addresses in peered VPCs cannot overlap as this would cause many issues due to potential duplicates and routing confusion. Transitive peering, where traffic passes through one VPC on its way to a destination VPC is also not supported

15) You have an EC2 instance with a Security Group attached. This security group is configured to only allow inbound traffic from 192.168.0.0/24. A collegue has also configured a NACL on the subnet that the instance resides on, and this NACL is configured to block all traffic, except where the source or destination is in 192.168.0.0/24. What will happen when an instance with an IP of 192.168.1.12 tries to connect to your instance on port 80?
* [ ] The traffic will be blocked simultaneously by the Security Group and NACL
* [ ] The traffic will be allowed as it is still within a private range
* [ ] The security group will block the traffic before it is evaluated by the NACL
* [x] The NACL will block the traffic before it is evaluated by the security group
> [NACL vs Security Group](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Security.html#VPC_Security_Comparison).

16) You are trying to establish a VPC peering connection with another VPC, and you discover that there seem to be a lot of limitations and rules when it comes to VPC peering. Which of the following is NOT a VPC peering limitation or rule? (Choose 2)
* [x] You cannot create a VPC peering connection between VPCs in different regions.
* [x] A cluster placement group cannot span peered VPCs.
* [ ] You cannot have more than one VPC peering connection between the same VPCs at the same time.
* [ ] You cannot create a VPC peering connection between VPCs with matching or overlapping CIDR blocks.
> CIDS blocks must be different, Transitive Peering is not supported, Infos on [VPC Peering](https://docs.aws.amazon.com/vpc/latest/peering/what-is-vpc-peering.html).

17) You have been asked to implement a private connection between a client's premises and the AWS VPC they are using. The connection must be active within three weeks. The customer has a router that supports BGP, IPSec, and IPv4.
Which option should you suggest?
* [ ] OpenVPN
* [ ] VPC peer
* [ ] AWS Direct Connect
* [x] Hardware VPN connection
> Direct Connect is a physical connection between AWS and another (non-AWS) location. The installation timeframe can be measured in months, especially if physical backhaul is required.
> A hardware VPN connection is based on IPSec and can be configured and operational within minutes with the companies existing hardware. This is the preferred option given the customer's restrictions. More info [VPC-VPN](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html).

18) You have 6 VPC’s and need to configure AWS to allow communications between all 6 VPC. Which option below will allow communication between the VPCs with little admin overhead.
* [ ] 6 Transit Gateways
* [ ] 6 Peering Connections
* [x] 1 Transit Gateway
* [ ] 1 VPC Peering Connection
> VPC Transit Gateway is able to create the communcation among all 6 VPCs - [More info](https://docs.aws.amazon.com/vpc/latest/tgw/tgw-transit-gateways.html).

19) You are running a web application in your on-premises data center. The application currently has three web servers that receive traffic using round-robin DNS. As part of the move to AWS, you have been asked to design a solution that uses a load balancer to accept traffic and distribute it to web servers that are not accessible from the internet. Additionally, any database instances should only be accessible from the web servers. The database instances should not be in the same subnets as the web servers. You have been asked to make the solution highly available using three AZs. How many subnets will you require?
* [ ] Three
* [ ] One
* [x] Nine
* [ ] Six
> Choosing six would suggest you either think the load balancer and web servers are in the same tier or that the web servers and databases are. Each needs its own tier. The load balancers need to be publicly accessible — the web servers don't. The database servers also need to be private but in different subnets.
> Three tiers are required: load balancer, web servers, and database servers.
> Each AZ needs its own subnet for that tier: 3 x 3 = 9.

20) You have been asked to advise a junior colleague how to explicitly deny traffic from an EC2 instance to a specific remote internet FQDN. What advice would you give?
* [ ] Use a security group attached to the instance, and explicitly deny traffic to the FQDN.
* [ ] Use a security group attached to the VPC, and explicitly deny traffic to the FQDN.
* [ ] Use a NACL on the subnet that the EC2 instance is on, and deny traffic from the EC2 instance to the FQDN.
* [x] Implement a proxy service in the VPC, adjust route tables, and use the proxy server to deny access to the remote hostname.
> AWS has no NATIVE products capable of handling this type of denying traffic to an FQDN. (You can use partner solutions to do it so).

21) You need to design a VPC that is resilient to AZ failure from an internet access perspective. The VPC is in a four-AZ region. How many internet gateways are required to ensure multiple AZ failures won't disrupt internet connectivity?
* [ ] Zero - internet access is provided by a NAT gateway
* [ ] Four
* [x] One
* [ ] Two
> A InternetGateway is redundant by itself, however, a NAT gateway is not! (you need one per subnet for full HA).
> An IGW is resilient by design, and only one needs to be attached to a VPC in order to provide all subnets in all AZs with resilient internet connectivity. You cannot assign more than one IGW to a VPC.

22) You are reviewing an existing VPN between a data center and an AWS VPC. Your client has asked you to suggest any HA improvements; the system must be able to tolerate the failure of an AWS AZ and a customer internet connection or router. Currently, the system includes:
> One VPC
> One business location with two internet connections — each with a router
> One VPN connection using one virtual private gateway and two IPSec tunnels to one of the customer routers
Which option below is the most appropriate and correct?
* [ ] Add an additional virtual private gateway to the VPC.
* [ ] Move one of the IPSec tunnels to the other customer router.
* [x] Add another VPN connection to the second CGW.
* [ ] Take no action — the system meets the HA requirements with no changes.
> TODO

23) A company hosts a Redshift Cluster in AWS. For security, they want to ensure all traffic from/to the cluster doesn't go through the internet. Which features can be used to fulfill this requirement efficiently?

* [x] Enable Redshift Enhanced VPC Routing
* [ ] Create a NAT Gateway
* [ ] Create a NAT Instance
* [ ] Create a VPN Connection to ensure traffic doesn't flow through the Internet
> You can use Amazon Redshift's Enhanced VPC Routing to force all of your COPY and UNLOAD traffic to go through your Amazon Virtual Private Cloud (VPC). Enhanced VPC Routing supports the use of standard VPC features such as VPC Endpoints, security groups, network ACLs, managed NAT and internet gateways, enabling you to tightly manage the flow of data between your Amazon Redshift cluster and all of your data sources. In particular, when your Amazon Redshift cluster is on a private subnet and you enable Enhanced VPC Routing, all the COPY and UNLOAD traffic between your cluster and Amazon S3 will be restricted to your VPC. You can also add a policy to your VPC endpoint to restrict unloading data only to a specific S3 bucket in your account, and monitor all COPY and UNLOAD traffic using VPC flow logs. [More Info](https://aws.amazon.com/about-aws/whats-new/2016/09/amazon-redshift-now-supports-enhanced-vpc-routing/)

34) You company wants to run an application that requires a max processing of 500MiB/s. Which is the most cots-efficient solution?
* [ ] EBS IOPS
* [ ] EBS SSD
* [x] EBS Throughput Optimized
* [ ] EBS Cold Storage
> Throughput Optmized is good enough. [More Info](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volume-types.html).


## Databases

### RDS

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
> More info on [RDS Monitoring Overview](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MonitoringOverview.html).

3) In accordance with your company's overall business continuity plan, you are looking at implementing a resiliency & disaster recovery strategy for your production MariaDB database. This currently utilises 5 disbursed Read Replicas. You are considering the use of Amazon RDS Multi-AZ deployments in combination with the Read Replicas. Which of these statements regarding that are false?
* [ ] If the source instance of a Multi-AZ deployment fails over to the secondary, any associated Read Replicas automatically switch to use the secondary (now primary) as their replication source.
* [ ] RDS Read Replicas support Multi-AZ deployments for MariaDB with 5 Read Replicas
* [ ] You cannot combine Read Replicas with Multi-AZ deployments for the MariaDB database engine. Only PostgreSQL, Aurora and Oracle database engines are supported.
* [ ] With RDS for MariaDB, you can set the read replica as Multi-AZ, allowing you to use the read replica as a DR target. When you promote the read replica to be a standalone database, it will already be Multi-AZ enabled.
> More info [MariaDB Read Replicas](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_MariaDB.Replication.ReadReplicas.html).

4) A developer accidentally deleted a couple of PostgreSQL database tables in the staging environment. Since you are using AWS RDS, you are planning to restore it using the most recent backup of the database. Select the invalid statement.
* [ ] Amazon RDS provides two different methods for backing up and restoring your DB instance(s) - automated backups and database snapshots. DB Snapshots are user-initiated and enable you to back up your DB instance in a known state as frequently as you wish, and then restore to that specific state at any time.
* [ ] Your Amazon RDS backup storage for each region is composed of the automated backups and manual DB snapshots for that region. Your backup storage is equivalent to the sum of the database storage for all instances in that region.
* [x] Automated backups occur daily during the preferred backup window. If the backup requires more time than allotted to the backup window, the backup stops and you will be notified.
* [ ] You can set the backup retention period to between 0 and 35 days. Setting the backup retention period to 0 disables automated backups. The default backup retention period is seven days if you create the DB instance using the console.
> If the backup requires more time than allotted to the backup window, the backup continues after the window ends, until it finishes.

5) Which of the following RDS database types support RDS Read Replicas?
* [ ] Microsoft SQL
* [x] Oracle
* [x] PostgreSQL
* [x] Aurora
* [x] MariaDB
* [x] MySQL
> IMPORTANT: For 2020 SQL Server is supported, but at the time the old exam was created it wasn't.
> More info [SQL Server Read Replicas Releaase](https://aws.amazon.com/blogs/database/using-in-region-read-replicas-in-amazon-rds-for-sql-server/).

6) You are investigating a performance issue on a MYSQL RDS database and discover that there is only a single DB instance in a single Availability Zone for this database. This goes against your organisation's availability requirements, which specify that the application must automatically remain available during AZ outages and with minimal interruption. This needs to be addressed, along with the performance issue. How would you go about resolving this, while keeping cost to a minimum?
* [x] Modify the database to be Multi-AZ to address the availability requirement, and deploy a read replica to improve performance
* [ ] Modify the database to be Multi-AZ to address the availability requirement. This will also address the performance issue as there will now be 2 instances for reads and writes.
* [ ] Deploy a Read Replica for the database into a different AZ to address the availability requirement. Create another read replica in primary zone to improve performance.
* [ ] Deploy a Read Replica for the database into a different AZ. This will address the performance issue, and can be used in case of a AZ outage
> As this scenario requires that there is minimal interruption to service in case of a AZ outage, any answer using the Read Replica for availability can be discounted. This leaves using a Multi-AZ configuration with a Read Replica as the only valid option.

7) You are researching if a setup with MySQL RDS having both MultiAZ and a ReadReplica could impact the performance of transactions on the master write replica. What is true?:

* [ ] Performance is impacted if you enable Synchronous Replication
* [ ] Performance is impacted if you enable Asynchronous Replication
* [ ] Performance is impacted
* [x] Performance is NOT impacted
> RDS is performing async replication, so there is no performance impact on the master, only replication lag to the read

### Aurora

1) A financial market dashboard needs to update asset values almost instantaneously for customers across the United States. Updates will be written to the primary application instance which resides in the AWS us-east-1 region. Which database architecture will provide the best performance for consumers of the dashboard's information?
* [ ] Implement Amazon Aurora MySQL with Aurora Replicas using cross-region physical replication. Create the replicas in the AWS us-east-2 and us-west-2 regions.
* [x] Deploy Amazon Aurora MySQL with Aurora Replicas using cross-region logical replication. Create the replicas in the AWS us-east-2 and us-west-2 regions.
> Aurora Replica **physical replication can only replicate to one secondary region**
> More info on [Aurora Docs](https://aws.amazon.com/rds/aurora/faqs/)

2) As a Cloud Solutions Architect, you have been tasked to set up an enterprise-class database with six-way replication across three Availability Zones. This measure is proposed to strengthen the database's fault tolerance to disk failures. Which of the following engines will enable you to do that?
* [ ] Oracle
* [ ] MySQL
* [x] Amazon Aurora
* [ ] MariaDB
> Six-way replication is only available for Aurora

3) You company runs a website that is presenting content that is stored in a back-end Aurora cluster. Content that makes up this website is created and managed from a handful of EC2 instances in your VPC, and this content is then accessed by a different set of EC2 instances acting a web servers in a public subnet. Which Aurora Endpoint should be used by the EC2 instances involved in the creation and management of the content?
* [ ] The Writer Endpoint
* [ ] The Management Endpoint
* [x] The Cluster Endpoint
* [ ] The Instance Endpoint
> The Cluster Endpoint is most appropriate for this scenario. There is no such thing as a Writer Endpoint or Management Endpoint, and this is not an appropriate use of the Instance Endpoint.

### DynamoDB

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

4) How does AWS deliver high durability for DynamoDB?
* [ ] Like S3, DynamoDB is a global service -- data is automatically replicated across multiple AWS Regions.
* [ ] AWS maintains a schedule of incremental backups and log shipping.
* [x] DynamoDB data is automatically replicated across multiple AZs.
* [ ] DynamoDB supports user Snapshots to S3.
> DynamoDB is not automatically replicated to other regions, yet within a region it is replicated to multiple AZs.

5) An SEO company collects data based on disparate search engine optimization metrics and stores it in a DynamoDB database. The company wants to create an extra copy of the database tables as a form of disaster recovery. Which of the following AWS services can do that?
* [ ] Amazon Elastic Compute Cloud (EC2)
* [ ] Amazon Relational Database Service (RDS)
* [x] AWS Backup
* [ ] Amazon Simple Storage Service (S3)
> AWS Backup allows you to connect DynamoDB to other services, like S3. More info [AWS Backup](https://aws.amazon.com/backup/).

6) Which of the following suggestions could help reduce DynamoDB running costs?
* [x] Utilize indexes
* [ ] Filter the attributes read from a table
* [ ] Use Scan rather than Query operations
* [ ] Increase RCU
> Indexes allow you to define alternative partition and/or sort keys, which can allow you to use Query rather than Scan operations. Additionally, you can choose which attributes are projected into the indexes, meaning you will read less data for each ITEM retrieved. More info: [LSI](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LSI.html) & [GSI](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GSI.html).

7) You have a collection of several million JSON documents. You want to store their data within AWS. The data needs to be searchable based on a unique ID in the JSON, and the searches need to be available from a public endpoint. The data is important, so it needs to be able to survive an AZ failure in AWS, and the data latency needs to be in the low milliseconds. What service should you suggest?
* [ ] S3
* [ ] EC2 and EBS
* [x] DynamoDB
* [ ] EFS
> The latency demands and requirement to query the data make another option a more viable solution. S3 meets the resilience requirements.
> DynamoDB is the ideal solution. It offers low latency, can store data for querying, and replicates data across AZs in the region the table is created in.

8) Your application needs to perform 100 eventually consistent reads per second from DynamoDB. Each read is 7 KB in size. What is the minimum number of RCUs required to meet this demand?
* [ ] 700
* [ ] 350
* [x] 100
* [ ] 200
> Here it is asking for EVENTUALLY consistent reads, not strongly consistent.
> For items up to 4 KB in size, one RCU can perform TWO eventually consistent read requests per second, meaning that 7 KB rounds up to 8 KB and then to perform 100 consistent reads per second: 2 RCU (because of the record) -> each RCU accepts two READS per second, so for eventually consistency: ((4KB * 2 reads) * 100 reads per second)/2 reads per second = 100 RCU
> For strongly consistency, then 200 would be required.
> Formulas:
>   strongly consistent: round(<ITEM_SIZE>/4) * <NUMBER_OF_ITEMS>
>   eventually: <strong_formula>/2
> [More info](https://linuxacademy.com/guide/20310-how-to-calculate-read-and-write-capacity-for-dynamodb/)

## KMS

1) The marketing department at your company wants to run a Hadoop cluster on Amazon EMR to perform data mining on a 2 TB dataset. Your information security group requires that all data be encrypted in transit and at rest, both on-premises and in the cloud at all times. Encryption keys must be stored in the on-premises key management solution. You've decided to transmit the data to Amazon S3 using TLS. How will you protect the data at rest for processing by the EMR cluster?
> Since the key must be managed on permises you need to encrypt data on your client-side, by using KMS the keys would be managed by AWS.
> Use the AWS SDK for Java to implement the encryption materials provider interface in the EMRFS client. Retrieve the key from the on-premises key management system to decrypt the data stored in S3

## S3

1) Which of the following are valid S3 data encryption options?
> SSE-KMS, SSE-C, SSE-S3, Client Library on S3 Encryption Client
> [S3 Encryption](https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html)

2) You're researching third-party backup solutions to backup 10 TB of data nightly to Amazon S3. File restores won't be needed often, but when they are, they'll need to be available in under five minutes. Your analysis shows that you will exceed your budget for backup storage and you need to find a way to reduce the estimated monthly costs. How should you modify the solution to achieve the cost reduction needed?
* [ ] Create an S3 lifecycle rule to move the data immediately to Amazon S3 Glacier
* [x] Choose a third-party backup solution that writes directly to the Amazon S3 Glacier API
* [ ] Choose a third-party backup solution that leverages AWS Storage Gateway to write data to Amazon S3 Glacier
* [ ] Write the data directly to the S3 Standard-Infrequent Access Storage ClassSELECTED
> Source: Q: What are Expedited retrievals?
> Expedited retrievals allow you to quickly access your data when occasional urgent requests for a subset of archives are required. For all but the largest archives (250MB+), data accessed using Expedited retrievals are typically made available within 1 to 5 minutes. There are two types of Expedited retrievals: On-Demand and Provisioned. On-Demand requests are fulfilled when we are able to complete the retrieval within 1 to 5 minutes. Provisioned requests ensure that retrieval capacity for Expedited retrievals is available when you need them.

3) You are about to encrypt the data in your S3 buckets, and you need a solution to enable the use of a customer master key (CMK) as an added layer of protection against unauthorized access. In addition, this solution must provide you with an audit trail that shows you when and who used the CMK. Which of the following choices denote this type of encryption?
* [ ] Server-Side Encryption
* [ ] Server-Side Encryption with Customer-Provided Keys (SSE-C)
* [ ] Server-Side Encryption with Amazon S3-Managed Keys (SSE-S3)
* [x] Server-Side Encryption with AWS Key Management Service (SSE-KMS)
> Generally speaking, SSE is actually correct. However, the question is asking for a specific type of server-side encryption. SSE-S3 is another possible answer, since it encrypts the objects in the S3 buckets and Amazon S3 manages the encryption keys. However, the CMK and audit trail attributes are missing from this choice. With SSE-KMS, you get the CMK addition for added protection, as well as the audit trail, which is why SSE-KMS is the right answer. SSE-C is not the right choice because you, rather than Amazon, would manage the keys. TLDR - if you need audit, KMS is the way to go. More info on [S3 SSE](https://docs.aws.amazon.com/AmazonS3/latest/dev/serv-side-encryption.html).

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
> More info on [S3 Classes](https://aws.amazon.com/s3/storage-classes/).

6) You have an application that allows people in very remote locations to store their files safely and securely. You need to leverage CloudFront's globally distributed Edge Locations, so that as data arrives at an Edge Location the data is routed to your Amazon S3 bucket over an optimized network path. Which of the following services should you use?
* [ ] S3 Multipart Upload
* [x] S3 Transfer Acceleration
* [ ] CloudFront Multipart Upload
* [ ] CloudFront Transfer Acceleration
> More info on [TransferAccelation](https://docs.aws.amazon.com/AmazonS3/latest/dev/transfer-acceleration.html).

7) A company needs to maintain access logs for a minimum of 5 years due to regulatory requirements. The data is rarely accessed once stored, but must be accessible with one day's notice if it is needed. What is the MOST cost-effective data storage solution that meets these requirements?
* [x] Store the data in Amazon S3 Glacier Deep Archive storage and delete the objects after 5 years using a lifecycle rule.
* [ ] Store the data in Amazon S3 Standard storage and transition to Amazon S3 Glacier after 30 days using a lifecycle rule.
* [ ] Store the data in logs using Amazon CloudWatch Logs and set the retention period to 5 years.
* [ ] Store the data in Amazon S3 Standard-Infrequent Access (S3 Standard-IA) storage and delete the objects after 5 years using a lifecycle rule
> Glacier Deep Archive is the cheapest you can get - More info [S3 Storage Classes](https://aws.amazon.com/s3/storage-classes/).

8) You have a requirement that all objects stored in a particular bucket be copied to another region. You have enabled Cross Region Replication from the source bucket to the target bucket, but objects are not appearing in the target bucket as expected. What are some possible reasons this could be happening? (Choose 3)
* [x] The objects created with server-side encryption using customer-provided (SSE-C) encryption keys.
* [ ] The object tags in the source bucket have not been assigned.
* [x] The objects in the source bucket are replicas that were created by another cross-region replication.
* [ ] The object does not have lifecycle configuration enabled.
* [x] The objects existed before you added the replication configuration to the source bucket.
* [ ] The objects in the source bucket for which the bucket owner has permissions to read objects and ACLs.
> More info [S3 Cross-Region Replication](https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-troubleshoot.html).

9) CRR replicates every object-level upload that you make directly to your source bucket. Which of the following also forms a part of that replication? (Choose 2)
* [x] The object ACLs
* [ ] The object's checksum encryption data
* [ ] The object's SSL certificate
* [x] The object metadata
> "... copy the objects over the top of themselves, preserving tags, access control lists (ACLs), metadata, and encryption keys" - [Cross Region Replication](https://aws.amazon.com/blogs/big-data/trigger-cross-region-replication-of-pre-existing-objects-using-amazon-s3-inventory-amazon-emr-and-amazon-athena/).

10) You work for a security company that stores highly sensitive documents on S3. One of your customers has had a security breach and, as a precaution, they have asked you to remove a sensitive PDF from their S3 bucket. You log in to the AWS console using your account and attempt to delete the object. You notice that versioning is turned on, and when you dig a little deeper you discover that you cannot delete the object. What may be the cause of this?
* [x] You cannot delete the object because you are not the bucket owner.
* [ ] S3 server-side encryption is preventing you from doing this.
* [ ] You must be logged in as a Super User to delete objects.
* [ ] You can never permanently delete an object on S3 after versioning is enabled.
* [ ] Only the owner of an Amazon S3 bucket can permanently delete a version.
> More info on [Deleting versioned objects](https://docs.aws.amazon.com/AmazonS3/latest/dev/DeletingObjectsfromVersioningSuspendedBuckets.html). "Only the bucket owner can delete a specified object version.".

11) When setting up the properties of an S3 bucket, which of the following options should you select to track storage cost?
* [ ] Object-level logging
* [ ] Server access logging
* [ ] Versioning
* [x] Tags
> AWS uses tags to group and track cost on the reports

12) Your application stores your customers' sensitive passport information in S3. You are required by law to encrypt all data at rest. Company policy states that you must maintain control of your encryption keys. For ease of management, however, you do not want to implement or maintain a client-side encryption library. Which S3 encryption option should you use to secure your data at rest?
* [ ] Amazon S3 Encryption Client
* [ ] SSE-KMS
* [x] SSE-C
* [ ] SSE-S3
> If there is no intention to manage a client-side library then SSE-C is the way to go.

13) What is the minimum billable object size for S3 - IA?
* [x] 128 KB
* [ ] 1 KB
* [ ] 0 Bytes
* [ ] 1 Byte
> The minimum object size is 0 bytes, however you will be billed for 128 KB. Objects smaller that 128 can still be stored, but will be billed as if they are 128KB.

14) The company you work for has been acquired and you have been tasked with the redirection of all its website traffic to the new company's website. The old one is hosted on S3 as a static website while the target is a self-hosted website. Which of the following options describes the best approach to achieve that as quickly as possible?
* [ ] In the Amazon S3 console, set the website redirect location in the metadata of each object in the relevant public bucket. You can do so by specifying the new domain as the value of the 'Website-Redirect-Location' key within the 'Metadata' section under the Properties tab.
* [x] In the Amazon S3 console, configure a redirect to the new domain in the 'Redirect requests: Target bucket or domain' box within the 'Static website hosting' section under the Properties tab of the relevant bucket.
* [ ] Amazon S3 does not support website redirects. You will need to contact your domain registrar and ask them to update the target URL to point to the self-hosted website.
* [ ] Amazon S3 static website hosting supports only redirects to other AWS S3 buckets but not to external URLs. Therefore, you should set up a redirect to a new bucket with a single HTML file in it that uses client-side scripting (window.location.ref and a 'refresh' http-equiv meta tag) for the redirect to the new domain.
> First option for 1 specific object, second for the whole bucket.
>
> [More Info](https://docs.aws.amazon.com/AmazonS3/latest/dev/how-to-page-redirect.html).

15) When coding a routine to upload to S3, you have the option of using either single part upload or multipart upload. Identify all the possible reasons below to use Multipart upload. (Choose 4)
* [x] Multipart upload delivers the ability to pause and resume object uploads.
* [x] Multipart upload delivers improved throughput.
* [x] Multipart upload delivers the ability to begin an upload before you know the final object size.
* [ ] Multipart upload delivers improved security in transit.
* [ ] Multipart upload delivers the ability to append data into an open data file.
* [x] Multipart upload delivers quick recovery from network issues.
> Almost textbook, except for the ability to append-data into an open data-file, which "cannot be done". [More info](https://docs.aws.amazon.com/AmazonS3/latest/dev/uploadobjusingmpu.html).

16) You are working on a research project for a healthcare insurer and your first task is to ingest 6 months of trial data collected by about 30 participating physicians around the country. Each data set is about 15 GB in size and contains protected health information. You are proposing to use S3 Transfer Acceleration for the data upload to an S3 bucket but a colleague raises some concerns about that. Which of the following statements are valid?
* [ ] It will take a long time because S3 Transfer Acceleration does not support all bucket level features including multipart uploads.
* [x] The name of your bucket used for Transfer Acceleration must be DNS-compliant and must not contain periods ('.').
* [ ] Because S3 Transfer Acceleration is not a HIPAA eligible service, you can't use it to transfer protected health information between the physicians and your Amazon S3 bucket.
* [ ] Most physicians have only about 40 to 50Mbps of available bandwidth. S3 Transfer Acceleration is therefore not a good option.
> More info: [S3 Transfer Acceleration](https://docs.aws.amazon.com/AmazonS3/latest/dev/transfer-acceleration.html).

17) Your company wants to setup S3 ensuring the data in there can survive an entire region failover. What do you have to do?

* [ ] Copy S3 to an EBS volume on another region
* [ ] AWS S3 is already fault tolerant by design, no need to do anything
* [x] Enable Cross-Region Replication for the Bucket
* [ ] Enable Versioning
> [More info](https://docs.aws.amazon.com/AmazonS3/latest/dev/replication.html)

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

2) Your image manipulation application allows users take a picture, upload it to your app, and request filters to be added to the image. You need to decouple the application so your users are not waiting for the image processing to take place. How would you go about doing this?
* [x] Use Amazon SQS to store the requests using metadata and JSON in the message, use S3 to store the image, and Auto Scaling to determine when to fire off more worker instances based on queue size.
* [ ] Integrate with DynamoDB to allow messages to be sent back and forth between worker instances and EC2 instances.
* [ ] Use S3 to store the images and EC2 to process the requests.
* [ ] Use Lambda to process the images.
> Dynamo does not send messages, and it is not (by default at least) fully consistent to do such, the system using EC2 does not solve the decoupling and lambda still needs to process from somewhere.

3) An EC2 instance retrieves a message from an SQS queue, begins processing the message, then crashes. What happens to the message?
* [ ] To prevent corruption, the message is deleted.
* [ ] It remains in the queue in a locked state until the EC2 instance comes back online.
* [x] When the message visibility timeout expires, the message becomes available for processing by other EC2 instances.
* [ ] When the message timeout expires, the message is duplicated, the original message is archived, and the duplicate becomes available for processing.
> The message goes "back" to the queue once it is not processed within the timeout

4) Your development team have created a cloud specific application which is decoupled from other services. You have been tasked with choosing an AWS service to use as message queue in this service. The developers have specified that the chosen service must cope with at least 5000 transactions per second, guarantee delivery of each message but allows for the message being sent a number of times.
* [ ] SNS
* [ ] SQS FIFO
* [ ] Amazon MQ
* [x] SQS Standard
> No need for order guarantee and the number of transactions is pretty big

## Kinesis

1) You want to create a video stream and then send the video to it using your smartphone. In addition, you want to retain the data of this stream for 24 hours. Which of the following configurations will accomplish this? (Choose 2)
* [ ] Amazon Kinesis Firehose stream with a custom retention period of 1 day
* [ ] Amazon Kinesis Firehose stream with a default retention period
* [x] Amazon Kinesis video stream with a default retention period
* [x] Amazon Kinesis video stream with a custom retention period of 1 day
> To stream video from your smartphone, you have to use an Amazon Kinesis video stream. At the 'Create video stream' page, you can either set a retention period for the stream with the default configuration, which is 1 day, or specify the 24-hour period with the custom configuration by choosing the '1 day(s)' option. Kinesis Firehose is for preparing and loading real-time data streams into data stores and analytics tools so is not the correct service.

## Route53

1) The media company Starbright Entertainment owns the domain name starbright.net. They want to provide an online customer portal which will be addressed via the starbright.net domain. They create an ELB Classic Load Balancer in front of the portal's web servers which gets assigned the host name clb1-1234.us-west-2.elb.amazonaws.com. Which type of Route 53 hosted zone record will they use to point to the load balancer?
* [x] Alias Record (Alias)
* [ ] Canonical Name Record (CNAME)
* [ ] Service Locator (SRV)
* [ ] Pointer Record (PTR)
> An Amazon Route 53 Alias Record is an extension to DNS functionality. It provides the ability to map a domain name to select AWS services, including ELB load balancers. DNS PTR records are used for reverse DNS lookups. CNAME records map aliases to true or other canonical names, but a Route 53 Alias record is better for this use case because it will point to the load balancer even if its IP address changes. An SRV record is used for specifying data in a DNS system.
> Route 53 alias records are mapped internally to the DNS name of alias targets such as AWS resources. Route 53 monitors the IP address associated with an alias target's DNS name for scaling actions and software updates. The authoritative response from Route 53 name servers contains an A record (for IPv4 addresses) or AAAA record (for IPv6 addresses) with the IP address of the alias target.
> More info on [AWS Route53 Documentaion](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-choosing-alias-non-alias.html).

2) Which of the following DNS record types does Route 53 not support?
* [ ] AAAA
* [ ] SPF
* [x] DNSKEY
* [ ] CNAME
> DNSKEY is not a supported [More info](https://aws.amazon.com/route53/faqs/).

## General

### Support Plans

1) You want to contact AWS Technical Support regarding ensuring enough capacity to autoscale for busy periods. You remember that you have a Basic Support plan. Which of the following case types can you open with this support plan?
* [x] Service Limit Increase
* [ ] Customer Service
* [ ] Technical Support
* [x] Account and Billing Support
> There are three types of AWS Support cases you can open; they are Account and Billing Support, Service Limit Increase, and Technical Support. Customer Service does not exist as a case type, which eliminates 'Customer Service'. With the Basic plan, you can open either an Account and Billing Support or a Service Limit Increase case. To open a Technical Support case, you will need to get a Developer, Business, or Enterprise plan. So, 'Technical Support' is the wrong response; 'Account and Billing Support' and 'Service Limit Increase' are correct.

### Scalability

1) Which of the following characterize a scalable and reliable solution on AWS? (Choose 2)
* [ ] A scalable solution applies elasticity at the expense of cost.
* [x] A scalable application will be resilient and operationally efficient
* [ ] A scalable solution applies elasticity, but is cost-agnostic.
* [x] A scalable solution will decrease in cost at scale.
> Scalable has to take operational cost into account, otherwise everything is scalable. e.g.: if you double your traffic you should not have more than double the cost, it must be min. linearly, but it should decrease at scale.

### Availability/Fault-Tolerance

1) A Multi-AZ RDS deployment will automatically fail-over as a result of which two of the following? (Choose 2)
* [ ] A region-wide loss of service
* [ ] Loss of availability in standby Availability Zone
* [x] Loss of availability in primary Availability Zone
* [x] Loss of network connectivity to the Primary
> Only "primary" related events react with fail-over.

2) Four servers are used in order to optimally run an application under normal and heavy operations. What architecture layout ensures high availability and cost efficiency if an Availability Zone has a failure?
* [ ] Deploy eight servers evenly across two Availability Zones
* [ ] Deploy eight servers to a single Availability Zone
* [x] Deploy four servers evenly across two Availability Zone
* [ ] Deploy four servers to a single Availability Zone
> 8 Servers across 2 AZs - This would not be cost-efficient because it is not necessary to have this much computing power. Remember, high availability means that a system is available but might have performance degradation.
> 4 servers across 2 AZs - If one AZ has a failure, then there are still two servers that can respond to requests. This would be cost-efficient because you are not spending on more compute than necessary. It would be highly available because the application can still function but with performance degradation.

### Security

1) You are currently running an application in a production environment and you want to ensure that it is free of vulnerabilities. Which of the following AWS services would you use to accomplish this?
* [ ] AWS Web Application Firewall (WAF)
* [ ] AWS Trusted Inspector
* [x] Amazon Inspector
* [ ] AWS Shield
> WAF is a firewall tool, shield is a DoS prevention tool and Truested is for compliance, not for vulnerability scanning.

2) Which of the following layers of DDoS attacks does AWS automatically address? (Choose 2)
* [ ] Layer 7
* [x] Layer 4
* [x] Layer 3
* [ ] Layer 1
> AWS automatically addresses DDoS attacks at the network and transport layers, which are Layer 3 and Layer 4, respectively.
> The attacks are distinguished by "Application"(Layer 6,7) and "Network"(Layer 3,4)
> More info [AWS Shield](https://aws.amazon.com/shield/ddos-attack-protection/). "Your AWS resources automatically have AWS Shield Standard and are protected from common, most frequently occurring network and transport layer DDoS attacks."

3) You company wants to ensure CloudWatch logs are encrypted, they should:

* [ ] Enable Server-Side Encryption for S3
* [ ] Enable Server-Side Encryption for CloudTrail
* [x] Do nothing, it is enabled by default
* [ ] Enable SSL for CloudTrail Logs
> [More Info](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/how-cloudtrail-works.html)

### License

1) You are speaking with a former colleague who asks you about cloud migrations. The place she is working for runs a large fleet of on-premise Microsoft servers and they are concerned about licensing costs. Which of the following statements is invalid?
* [ ] AWS License Manager includes features to help your organization manage licenses across AWS and on-premises. With AWS License Manager, you can define licensing rules, track license usage, and enforce controls on license use to reduce the risk of license overages. You can also set usage limits to control licensing costs. There is no additional charge for AWS License Manager.
* [ ] EC2 Bare Metal instances give the customer full control of the configuration of instances just as they have on-premise: The customer has the ability to install a hypervisor directly on the hardware and therefore define and configure their own instance configurations of RAM, disk and vCPU which can minimize additional licensing costs.
* [ ] License Mobility allows customers to move eligible Microsoft software to third-party cloud providers such as AWS for use on EC2 instances with default tenancy.
* [x] If I bring my own licenses into EC2 Dedicated Hosts or EC2 Dedicated Instances, then - subject to Microsoft's terms - Software Assurance is required.
> If you are bringing your own licenses into EC2 Dedicated Hosts or EC2 Dedicated Instances then Software Assurance is not required subject to Microsoft's terms.
