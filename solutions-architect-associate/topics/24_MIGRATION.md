# Migrations
> The Six Rs

* Rehost - Lift and Shift
  * Lift and shifting an application to the cloud. Basically, migrating servers to EC2 instances, recreating all network on VPC, Internet Gateways,... and changing almost nothing regarding applications and services. That's the easiest first step and the most common one too.
    * The customer already benefits from the pay-as-you-go model and is able to spawn up more resources for temporary use, or even scheduled demand (e.g.: reporting, traffic spikes,...).
    * Migration tools like AWS VM Import/Export are helpful for automation
    * Once the migration is done it is easy to transition to more AWS-like services, like RDS, Lambda, SQS and such. Re-architect!
* Rearchitect/Replatform - Lift, Tinker and Shift
  * Not so different from Re-host, but it includes bigger changes, like using RDS instead of hosting your own DB servers, using Elastic Beanstalk instead of manually provisioning the whole environments and machines...
* Refactor - Modernize
    * Re-imagining, modernizing the application with specific focus in mind. If the customer is migrating to the cloud it could be they are looking for a more flexible way to scale up and out their resources. Imagine changing an EC2 instance with a DB server to Aurora (auto-scalable), or switching from simple monoliths to a service-oriented approach,... or any other example using cloud-native services
* Retire
  * Shut-off applications that are not useful anymore, only migrate what makes sense.
* Retain/Revisit
  * Unable or not ready to migrate, for any number of reasons, e.g.: recently purchased, legacy, licensing,...
* Repurchase
 * Move entire applications/workflows to Software As A Service or Platform As A Service offerings, removing the need of migration.
