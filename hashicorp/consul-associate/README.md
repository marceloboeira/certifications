# Consul Associate

## Fundamentals

* [Certification Overview](https://www.hashicorp.com/certification/consul-associate) - To understand the test/goals
* [HashiCorp Associate Tutorials](https://learn.hashicorp.com/collections/consul/certification-associate-tutorials) - Some surface level stuff

# Exam Objectives

1. Explain Consul architecture
  1. Identify the components of Consul datacenter, including agents and communication protocols
  1. Prepare Consul for high availability and performance
  1. Identify Consul's core functionality
  1. Differentiate agent roles
1. Deploy a single datacenter
  1. Start and manage the Consul process
  1. Interpret a Consul agent configuration
  1. Configure Consul network addresses and ports
  1. Describe and configure agent join and leave behaviors
1. Register services and use service discovery
  1. Interpret a service registration
  1. Differentiate ways to register a single service
  1. Interpret a service configuration with health check
  1. Check the service catalog status from the output of the DNS/API interface or via the Consul UI
  1. Interpret a prepared query
  1. Use a prepared query
1. Access the Consul key/value (KV)
  1. Understand the capabilities and limitations of the KV store
  1. Interact with the KV store using both the Consul CLI and UI
  1. Monitor KV changes using watch
  1. Monitor KV changes using envconsul and consul-template
1. Back up and restore
  1. Describe the content of a snapshot
  1. Back up and restore the datacenter
  1. [Enterprise] Describe the benefits of snapshot agent features
1. Use Consul service mesh
  1. Understand Consul Connect service mesh high level architecture
  1. Describe configuration for registering a service proxy
  1. Describe intentions for Consul Connect service mesh
  1. Check intentions in both the Consul CLI and UI
1. Secure agent communication
  1. Understanding Consul security/threat model
  1. Differentiate certificate types needed for TLS encryption
  1. Understand the different TLS encryption settings for a fully secure datacenter
1. Secure services with basic access control lists (ACL)
  1. Set up and configure a basic ACL system
  1. Create policies
  1. Manage token lifecycle: multiple policies, token revoking, ACL roles, service identities
  1. Perform a CLI request using a token
  1. Perform an API request using a token
1. Use gossip encryption
  1. Understanding the Consul security/threat model
  1. Configure gossip encryption for the existing data center
  1. Manage the lifecycle of encryption keys

## Resources

* Books
  * [Consul - Up and Running: Service Mesh for Any Runtime or Cloud](https://www.amazon.de/-/en/Luke-Kysow/dp/1098106148) - Quite interesting overview (still reading it)
* Courses
  * [Udemy/HashiCorp-Consul](https://www.udemy.com/course/hashicorp-consul/) - Default course from Bryan Krausen
* Practice Tests
  * [Udemy/HashiCorp-Consul](https://www.udemy.com/course/consul-associate-practice-exam) - Complementary Practice Exams
* Deep-Dives
  * [Consul Service Mesh: Deep Dive](https://www.youtube.com/watch?v=Aq1uTozNajI)
  * [Ensuring Cross Cloud, High Availability for Your Applications](https://www.youtube.com/watch?v=OTcSHKljhLk)

## Gotchas
> A few things that might be relevant to review/pay extra attention to

Coming soons!

## Local Setup

The Makefile has all necessary commands to run the examples locally:

```
compose  Starts up consul servers via docker
help     Lists help commands
tf       Runs end-to-end workflow to update infra
tf_init  Configures terraform
tf_lock  Locks terraform dependencies
tf_plan  Runs terraform plan
tf_apply Apply infra changes
```
#
