# AWS Database Migration System

AWS Database Migration Service helps you migrate databases to AWS quickly and securely. The source database remains fully operational during the migration, minimizing downtime to applications that rely on the database. The AWS Database Migration Service can migrate your data to and from most widely used commercial and open-source databases.

It takes data from a Source and pushes to a Target.

### Workflow

* Source
  * Remains fully functional
  * Supports: MySQL, Postgres, Oracle, SQL Server ...
  * Support schema, data, and ongoing changes (CDC) migration
    * DMS Reads the Transaction Log
* Target
  * Receives schema, initial data migration and continuous data migration (CDC)
  * CDC - Change data capture


### Limits

Mainly, the size of source, replication and target database/instances

### Pricing

* On-Demand Instances (EC2 Instances)
* Log-Storage
* Data-Transfer Fees
