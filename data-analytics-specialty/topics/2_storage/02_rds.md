# Amazon RDS - Relational Database Service

Amazon Relational Database Service (Amazon RDS) makes it easy to set up, operate, and scale a relational database in the cloud. It provides cost-efficient and resizable capacity while automating time-consuming administration tasks such as hardware provisioning, database setup, patching and backups.

It runs on top of EC2, Route53, EBS/S3, providing an API for abstracting the management of database engines and operations.

## Engines

* Amazon Aurora - The only one with a cluster endpoint
* PostgreSQL
* MySQL
* MariaDB
* Oracle
* SQL Server

## Traits

* Parameter Group
  * Engine Parameters
  * Logging
  * Memory Management
* Option Group
  * Plugins (enable/disable)
  * Manage plugins settings
  * Not used by PgSQL
* Mostly Vertically Scaled (up, not out)
* Disaster Recovery - Automatic Failover
  * MultiAZ Deployment
  * Block-level replication (storage)
  * Roughly 60s

## Usecase

* Ecommerce
* Web
* Mobile
* Backend
* Fast OLTP
