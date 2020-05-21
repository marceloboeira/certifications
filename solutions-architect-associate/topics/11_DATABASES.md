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
* Snapshots

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
