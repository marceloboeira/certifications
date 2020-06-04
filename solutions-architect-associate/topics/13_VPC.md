# VPC
> Virtual Private Cloud

A Logically Isolated Network to launch your applications, servers, components safely.

You have complete control over IP, network and internet access, security groups, ACLs...

### Network Ranges

* Min is /28
* Max is /16
* TODO: Study the prefixes

###  VPC Peering

* Allows you to connect multiple VPCs through a network route using a private IP address
* You can peer VPCs to other AWS accounts
* Star configuration: 1 VPC connects to 4 others, no transitive peering.

### Takeaways

* The test has 5-10 questions about VPCs
* You need to know how to build a VPC
* Shared hardware tenancy is "free" (included on the price) / Dedicated hardware is charged

## Building a VPC

1. Create a VPC with the biggest IP-range, IPV6
  * No subnets are created by default
  * NO internet gateway is create
  * 1 Route-table is created by default
  * 1 NetworkACL is created by default
  * 1 SecurityGroup is created by default
1. Create 2 Subnets
  * In different AZ
  * We cannot have subnet span on AZ - 1 subnet for each AZ
  * Some addresses are reserved by AWS
    * 10.0.0.0 - Network address
    * 10.0.0.1 - Router
    * 10.0.0.2 - DNS Server
    * 10.0.0.3 - Reserved for Future Use
    * 10.0.0.255 - Network broadcast
1. Make the first subnet AWS publicly accesible (`map_public_ip_on_launch` on terraform)
1. Create an Internet Gateway for access
  * You can only have 1 attached to a VPC (they are cross region and internally replicated/designed for high-availability)
1. Create a route table (public one)
  * With routes to the internet gateway
  * Select IPv4/v6
  * Make it NOT the default one
1. Associate the Subnet to the Public Route Table
1. Create 2 EC2 Machines
  1. 1 with a SG allowing HTTP/SSH
  1. Attached to the Public Subnet
  1. THe second with a private subnet and default SG
  1. Create a Security Group that Allows HTTP/SSH from within the private range `10.0.1.0/24`
  1. Attach to the Private EC2
1. SSH Into the Public EC2
1. Ping the Private EC2 (address can be found on the AWS Console)
1. SSH into the Private (from the Public)
  *  By copying the private key
1. Allow NAT instances/gateways
  * NAT instances are EC2 instances
    * **important** I have not done the NAT instance step since it was quite outdated (no one, I hope, uses that on production...)
    * Takeaway:
      * You need to disable source/destination check
      * Must be in a public subnet
      * The amount of traffic depends on the route size
  * NAT gateways are components from AWS
    * Redundant inside the AZ
    * Only 1 per AZ
    * Start with 5Gbps up to 45Gbps
    * No need to patch
    * No need for SG
    * Update your route tables
    * No need to disable source/dest checks
  * You you always have a NAT gateways per AZ to avoid SPOF (Single Point of Failure)
1. Create a Network ACL
  * Make sure the default ACL is not changed
  * Set subnet-a/1 to that new ACL
  * The webpage on the public server should not work (not the SSH)
  * Update the new network to have specific ssh/http allow for port 80/22
  * Add [ephemeral ports](https://en.wikipedia.org/wiki/Ephemeral_port)
  * Test once more
  * Now, remember:
    * Rules work on chronological order, e.g.: if rule 100 allows port 80 and rule 101 blocks, it will be allowed.
    * Network ACL is a level lower than Security Groups, e.g.: if you block port 80 on ACL and allow on Security Group won't work, since it won't even try to reach the SG, the connection gets blocked
    * By default it allows everything (the default network ACL)
    * When you create a new one it denies everything!
    * Each subnet is automatically associated with the default ACL
    * You can only associate 1 ACL to 1 Subnet
1. You need at least 2 subnets for 1 ALB

## FlowLog

Log of your network on the IP level.

* Log in/out network logs
* You can store them on cloudwatch or S3 bucket
* 3 levels:
  * VPC
  * Subnet
  * ENI - Network Interface
* You can select the level (allowed/rejected/all)
* You cannot enable flow logs for peered VPCs not on your account
* You cannot change the configuration once created
* You can add tags
* Internal AWS traffic is not monitored (e.g.: DNS, metadata, windows activation)

## Bastion

A computer device on your network that is secure against attacks and serves as an entrypoint for access to other machines, isolated.

* You can get bastion hosts AMI (images) from AWS network
* Securely admin the rest of the instances
* You only need to create a allow/public path to the bastion instance and the other instances should not require such insecure conneciton
* Bastion should be well-secure to avoid attacks
* You cannot use your NAT gateway as a bastion host

## DirectConnect

Cloud service to facilitate the connection of a dedicated network from your data-center or network to AWS datacenter.

* You need to use AWS Cage or Partners cage
* You connect the routers internally
* It doesn't go "through the internet"
* High throughput workloads
* Highly secure applications
* How to setup
  * Create a public interface on DirectConnect Console
  * Create a customer gateway
  * Create a virtual private gateway
  * Attach to the VPC
  * Select the VPN and attach it
  * Once the gatway is setup you need firewall setup
  * TODO: [Review AWS Official Video](https://www.youtube.com/watch?v=dhpTTT6V1So&feature=youtu.be)

## GlobalAccelerator

Network-ISP bound shortcut to allow direct connection to AWS regions

* Static IP Address - you can bring your own, but 2 IPs are provided
* Accelerator - Directs traffic to AWS regions more precisely based on the source connection
* DNS Name - You get a DNS name which point to the static IP addresses
* NetworkZone - Similar to an AZ, it manages the Ip addresses for health-checking and such...
* Listener - Processes inbound connections (TCP/UDP), regions and endpoint configurations are allowed
* EndpointGroup - Associated with a AWS region, 1 or more endpoints, traffic % control...
* Endpoint - ELBs, EC2 Instances, Network Load Balancers... (you can have weighted endpoints)
* My Take
  * Similar to CloudFront but focused on low-latency, high-throughput and different protocol applications...

## VPC Endpoint

* A way to connect your instances directly to AWS Services
* Create a VPC Endpoint gateway (rather than a NAT gateway) using PrivateLink
* Have intances talking to internal aws endpoints
* Interface and Gateway EndpointTypes
  * Gateway Supports S3 and Dynamo Only

## VPC Summary

* VPCs are internal networks within AWS
  * They are consisted of
    * Gateway (for external access in/out)
    * Route Tables - To control traffic connections (e.g.: connect subnets, gateways, ...)
    * ACL - To allow/disallow connection / protocols (e.g.: allow TCP within a subnet)
    * Subnet - Subgroups of individual smaller networks with distinct permissions, ACLs and Routes (e.g.: private/public subnets)
      * 1 subnet per AZ
    * Security Groups - Rules for the individual instances or the subnet focused on high-level protocol management.
      *  [SG vs Network ACL](https://www.youtube.com/watch?v=4pDYLhfwauw)
      *  e.g.: if you allow port 22 on a SG but not on an NACL then it won't wont unless it is explicitly allowed (by an specific rule OR a general allow all one)
    * SG is stateful (inbound/outbout)
    * ACL is statelesss (you need to open up inbound and outbout individually)
  * No transitive peering
