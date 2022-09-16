# Certifications
> 📒 My binder for certification studies

# Tags

* 🆓 - No monetary cost
* 💰 - Paid content
* 📼 - Video content
* 📖 - Article/Written content
* 📝 - My Notes
* 💻 - Coding Samples


## Certifications

* AWS
  * [Solutions Architect Associate - SAA-C02](aws/solutions-architect-associate/) - This is the first recommended certification for technical roles, it is a high-level overview of the core-components of AWS and its main-features
  * [Data Analytics - Specialty - DAS-C01](aws/data-analytics-specialty/) - The exam is designed for professionals who work with data in a data-analytics focused job
* PagerDuty
  * [Incident Responder](https://university.pagerduty.com/certified-incident-responder-details/917915) -This certification exam will test your understanding of incident response best practices as well as the roles and responsibilities of the response team
* HashiCorp
  * [Terraform Associate (002)](https://www.hashicorp.com/certification/terraform-associate) - This certification is for Cloud Engineers specializing in operations, IT, or development who know the basic concepts and skills associated with open source HashiCorp Terraform.
  * [Consul Associate (002)](https://www.hashicorp.com/certification/consul-associate) - This certification is for Site Reliability Engineers, Solutions Architects, DevOps professionals, or other Cloud Engineers who know the basic concepts and skills to build, secure, and maintain open source HashiCorp Consul.
  * [Vault Associate (002)](https://www.hashicorp.com/certification/vault-associate) - This certification is for Cloud Engineers specializing in security, development, or operations who know the basic concepts, skills, and use cases associated with open source HashiCorp Vault.

### Structure

Each root folder is one namespace, for technology/tool specific, e.g.: `aws`, `pagerduty`, `hashicorp` and each 'certification' is composed of:
* `README.md` - With an index of important infos
* `Makefile` - to manage all operations of that repo
* `terraform/` - to practice and provision all infra required for the examples
* `topics/` - multiple notes, links, take-aways and important info on each topic covered on such certification
* `scripts/` - simple example scripts to provision or demonstrate usage of different services/components/features. Usually including companion make file aliases

If you want to use the Terraform module, make sure to install terraform and create a new AWS account.
