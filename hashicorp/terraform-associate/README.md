# Terraform Associate

## Fundamentals

* [Certification overview](https://www.hashicorp.com/certification/terraform-associate) - To understand the test/goals
* [HashiCorp Associate Tutorials](https://learn.hashicorp.com/collections/terraform/certification-associate-tutorials) - Some surface level stuff
* [Terraform: Up & Running: Writing Infrastructure As Code](https://www.amazon.de/-/en/Yevgeniy-Brikman/dp/1492046906) - Great source for refreshing IaC fundamentals, differences between tools and learnings basic terraform syntax
* [A Cloud Guru - Terraform Associate 1](https://learn.acloud.guru/course/hashicorp-certified-terraform-associate-1/learn/8082ae1e-6a81-4819-a607-e466765c0f54/05cd7c68-965d-4904-a98f-8834024152f3/watch) - Great source if you have never used/interacted with terraform

# Exam Objectives

1. Understand infrastructure as code (IaC) concepts
  1. Explain what IaC is
  1. Describe advantages of IaC patterns
1. Understand the purpose of Terraform (vs other IaC)
  1. Explain multi-cloud and provider-agnostic benefits
  1. Explain the benefits of state
1. Understand Terraform basics
  1. Install and version Terraform providers
  1. Describe plugin-based architecture
  1. Write Terraform configuration using multiple providers
  1. Describe how Terraform finds and fetches providers
1. Use Terraform outside of core workflow
  1. Describe when to use terraform import to import existing infrastructure into your Terraform state
  1. Use terraform state to view Terraform state
  1. Describe when to enable verbose logging and what the outcome/value is
1. Interact with Terraform modules
  1. Contrast and use different module source options including the public Terraform Module Registry
  1. Interact with module inputs and outputs
  1. Describe variable scope within modules/child modules
  1. Set module version
1. Use the core Terraform workflow
  1. Describe Terraform workflow ( Write -> Plan -> Create )
  1. Initialize a Terraform working directory (terraform init)
  1. Validate a Terraform configuration (terraform validate)
  1. Generate and review an execution plan for Terraform (terraform plan)
  1. Execute changes to infrastructure with Terraform (terraform apply)
  1. Destroy Terraform managed infrastructure (terraform destroy)
  1. Apply formatting and style adjustments to a configuration (terraform fmt)
1. Implement and maintain state
  1. Describe default local backend
  1. Describe state locking
  1. Handle backend and cloud integration authentication methods
  1. Differentiate remote state back end options
  1. Manage resource drift and Terraform state
  1. Describe backend block and cloud integration in configuration
  1. Understand secret management in state files
1. Read, generate, and modify configuration
  1. Demonstrate use of variables and outputs
  1. Describe secure secret injection best practice
  1. Understand the use of collection and structural types
  1. Create and differentiate resource and data configuration
  1. Use resource addressing and resource parameters to connect resources together
  1. Use HCL and Terraform functions to write configuration
  1. Describe built-in dependency management (order of execution based)
1. Understand Terraform Cloud capabilities
  1. Explain how Terraform Cloud helps to manage infrastructure
  1. Describe how Terraform Cloud enables collaboration and governance

## Resources

* Practice Tests
  * [Udemy](https://www.udemy.com/course/terraform-associate-practice-exam)
  * [Whizlabs](https://www.whizlabs.com/blog/terraform-certification-exam-questions/)
  * [Free questions](https://medium.com/bb-tutorials-and-thoughts/250-practice-questions-for-terraform-associate-certification-7a3ccebe6a1a)

## Gotchas
> A few things that might be relevant to review

* [Splat Expressions](https://developer.hashicorp.com/terraform/language/expressions/splat)
  * [Youtube Video](https://www.youtube.com/watch?v=pDa7eSlRkzM)
* [Dynamic Blocks](https://developer.hashicorp.com/terraform/language/expressions/dynamic-blocks)
* [Provisioner](https://developer.hashicorp.com/terraform/language/resources/provisioners/syntax)
  * [local-exec](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec)
  * [remote-exec](https://developer.hashicorp.com/terraform/language/resources/provisioners/remote-exec)
  * The supported protocols are: ssh, winrm
* [Workspaces](https://developer.hashicorp.com/terraform/cloud-docs/workspaces)
  * [OSS vs Cloud workspaces](https://developer.hashicorp.com/terraform/cloud-docs/workspaces#terraform-cloud-vs-terraform-cli-workspaces)
    * Terraform CLI workspaces are associated with a specific working directory and isolate multiple state files in the same working directory, letting you manage multiple groups of resources with a single configuration. The Terraform CLI does not require you to create CLI workspaces. Refer to Workspaces in the Terraform Language documentation for more details.
    * Terraform Cloud workspaces are required. They represent all of the collections of infrastructure in an organization. They are also a major component of role-based access in Terraform Cloud. You can grant individual users and user groups permissions for one or more workspaces that dictate whether they can manage variables, perform runs, etc. You cannot manage resources in Terraform Cloud without creating at least one workspace.
* Terraform Cloud Always encrypt state file at rest
* Terraform Enterprise - `Error: Could not load plugin`
* [Kubernetes Backend](https://developer.hashicorp.com/terraform/language/settings/backends/kubernetes) is a Real Thing
  * It has a 1MB state file size limitation
* Module Version Cache
  * If there is a version 1.0 already available, but you fixed and ran plan/apply with versio 0.0.5 of a module, what happens if you remove the version and run plan/apply?
  ```hcl
  module "consul" {
    source  = "hashicorp/consul/aws"
    version = "0.0.5"
    servers = 3
  }
  ```
  * Terraform continues using version `0.0.5` since that module was already initialized in state
  * More info [modules/version](https://developer.hashicorp.com/terraform/language/modules/syntax#version) and [version-constraints](https://developer.hashicorp.com/terraform/language/expressions/version-constraints)
