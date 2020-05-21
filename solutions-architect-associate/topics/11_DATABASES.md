# Databases

### OLTP vs OLAP

* Online Transactional Processing - Key->Value and almost no post-processing queries...
* Online Analytics Processing - Aggregation of thousands of rows/documents...

## RDS

Available on AWS:

* MySQL
* PostgreSQL
* Aurora (AWS proprietary)
* MariaDB
* SQL Server
* Oracle

RDS:

* Multi-AZ - for disaster recovery (automated fail-over switching)
* Read Replicas - for performance (up to 5 copies)

### MySQL Lab

1. Create an RDS with MySQL
1. Create a Security Group with 3306 inboud to EC2 SG
1. Access SSH on EC2
1. Install MySQL Driver [more info](https://dev.mysql.com/doc/mysql-repo-excerpt/5.7/en/linux-installation-yum-repo.html)
1. Connect to the database
1. Test some commands

## Backups

Two different types of backup for RDS:

* Automated
  * Up to 35 days retention period
  * Full daily snapshot with transaction logs
  * Recover to a specific Second in time (within the retention period)
  * Free storage size for the size of your RDS instance
  * Snapshots run on specific time-window every-day, your storage IO might be suspended and latency could be an issue
  * Not stored after db is deleted
* Snapshots
  * Done manually
  * Stored even after you delete the instance
  * The restored snapshot is always a new database with a new endpoint and configuration

## Encryption

* Data can be encrypted by AWS using KMS
* Once encryption is enabled, snapshots, and all storage related attachments are encrypted too (read replicaas, backups, ....)

## Replication

### Multi-AZ replication

* Synchronous replication (does it impact write times?)
* Automatic DNS swtich on incident
* For disaster only

### Read-replica

* For performance reasons
* Your application reads from the read replicas (to reduce backpressure from the main database)
* Replication is asynchronous (manually managed by amazon based on logs)
* Must have automated backups turned on
* Up to 5 read replicas
* You can have read replicas of read replica but latency becomes an issue for some applications
* Read replicas can have multi-az replication
* You can promote the read replica to its own instance, but it brakes the replication
* Read replicas can run in another region

### Take-aways

* RDS runs on virtual machines
* It is not your responsibility to maintain RDS updates
* You cannot SSH into the RDS machine

## Non-relational Databases

* DynamoDB

## Redshift

## Elastic Cache

In Memory cache to store complex or IO-expensive data, since it is faster than disk-baked operations.

Two different flavors:
* Redis
* Memcached
