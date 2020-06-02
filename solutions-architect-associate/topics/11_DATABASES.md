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

### DynamoDB

* NoSQL propriatary database from AWS
* Consistent single-digit millisecond latency at any scale
* Fully managed
* key-value or documents
* Uses SSD to store data
* 3 different data-centers? (AZ?)
* 2 models:
  * Eventual Consistency Reads - After a write, it might take a couple ms to read
  * Strongly Consistent Reads - After a write, it is already available for read

### Redshift

* AWS managed, fully operational fast and scalable pentabyte data-warehouse
* From $0.25 per hour (cheapest on the market)
* Single Node (160GB)
* Multi-node
  * Leader (manages connections and receive queries)
  * Compute (performs queries, computations and store data)
  * Up to 128 compute nodes
* Advanced compression
  * column based rather than traditional row compression
  * it doesn't require indexes or materialized views
  * automatically selects the best compression scheme
* Massive Parallel Processing
  * distribute queries across the nodes and makes it easier and faster to run big-data queries
  * helps to scale
* Backup
  * Default 1 day
  * Max 35 days
  * At least 3 copies
    * 1 original, 1 replica, 1 backup on S3
  * Can automatically replicate to S3 for disaster recovery scenarios
* Price
  * Node-hour price
    * No charge for leader, only compute nodes
* Encryption
  * In Transit SSL
  * At rest AES-256
  * Redshift takes care of key-management
    * You can manage your own with HSM
* Not available on multiple AZs (but you can restore)

### Aurora

MySQL/Postgres Compatible Database that combines speed and availability of high-end commercial databases with cost-effectiveness of an open-source.

* up to 5 times more performance than MySQL and up to 3 times PgSQL
* Up to 64 TB
* 10GB increments
* Scales automatically (storage)
* Up to 32vCPUs & 244 GB of memory
* 2 copies of your data are available within 3 availability zones, so 6 copies total
* Designed to sustain the loss of 2 copies of your data without affecting the write availability
* Up to 3 copies without affecting the read availability
* Self-healing, data blocks and disks are continuosly scanned and automatically repaired
* Replicas
  * Aurora Replica (up to 15)
  * MySQL Read Replicas (up to 5)
  * PostgreSQL Read Replica (1)
  * Supports different schemas
  * Aurora replicas are only in the same region
  * MySQL there is possible cross-region replica
  * MySQL specified replication delay is possible
* Backups
  * Automated backups always eneabled
  * Snapshots and Backups do not impact the performance of primary (write/read IOPS)
* Serverless
  * An option that is completely scalable and cost-effective
  * Pay per invocation, good for infrequent, intermitent work-loads

#### Aurora Lab

1. Create an aurora read replica of the old mysql
1. Wait for replication
1. Promote to master (you can also do that from a snapshot)

### Elastic Cache

In Memory cache to store complex or IO-expensive data, since it is faster than disk-baked operations.

Two different flavors:
* Redis
  * Redis is MultiAZ
  * Advanced Data Types (arrays, geospacial, ...)
  * Ranking Sorting
  * PubSub
  * Persisted
  * MultiAZ
  * BackupRestore
* Memcached
  * Multithreading

#### Redis Lab

1. Create a redis cluster
1. Add the SG to EC2 access
1. Ensure you install redis-cli on EC2 `sudo amazon-linux-extras install redis4.0`
1. Then use the host from aws console to use the CLI `redis-cli -h $HOST`
1. Create and Retrieve some keys
1. `set k 100`
1. `get k`

## Quiz Take-aways

* Provisioned IOPS - for performance requirements
* Max 16TB storage
* RDS Automated backups are enabled by default
* Backup window maintenance changes are applied instantaneously
* Athena File Format - Apache Parquet, JSON
* Backup snapshots and replication transfer is not charged on AWS, ORC, AVRO... (https://docs.aws.amazon.com/athena/latest/ug/supported-format.html)
* More:
  * https://aws.amazon.com/rds/faqs/
  * https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReadRepl.html
* You cannot SSH into RDS
* You cannot force single AZ for DynamoDB