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
