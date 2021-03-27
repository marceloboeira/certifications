# Storage and Data Management

* Introduction
* Types of Storage Solutions
* Operational Characteristics
* Data Freshness, access and retrieval patterns
* Data warehouse versus data lake
* Layout, schema structure and format
* Lifecycle, usage patterns and business requirements
* Metadata

## Types of Storage Systems

* Operational
  * Data stored as rows
  * Low-latency
  * High throughput
  * Highly concurrent
  * Frequent data-changes
  * Benefits from caching
  * Mission critical applications (OLTP)
  * Examples
    * [RDS](02_rds.md)
    * [DynamoDB](03_dynamodb.md)
    * [DocumentDB](05_documentdb.md)
    * Elasticcache
    * Timestream
* Analytical
  * Data stored as columns
  * DSS - Decision Support Systems
  * Large datasets (partitioning)
  * Frequent complex aggregation
  * Loading via bulk or sink-streaming
  * Less frequent change
  * Examples
    * [Redshift](08_redshift.md)
    * [S3](09_s3.md)

### Types of Databases

#### Relational

* Row-based
  * Picks-up an entire row at a time
  * OLTP - Online Transaction Processing
  * Low-latency applications
  * Rapid transactions
  * Proects data through rollbacks
  * Not good for
    * Running large transactions
    * Big-queries
* Column-based
  * Picks-up entire columns
  * OLAP - Online Analytics Processing
  * Large amounts of data
  * Complex/long-running queries
  * Analytics workloads
  * Not good for:
    * Rapid/real-time processing

### RDS - Relational Database Service

More on [RDS](02_rds.md)

* PostgreSQL
* MySQL
* MariaDB
* Oracle
* SQL Server
* [Redshift](08_redshift.md)

## NoSQL

* Key:Value
  * In-Memory - Caching / real-time storage
    * Elasticache
      * Memcached
      * Redis
  * Persisted
    * [DynamoDB](03_dynamodb.md)
* Document
  * [DynamoDB](03_dynamodb.md)
  * DocumentDB
  * MongoDB
* Graph - Pattern recognition and analytis
  * Neptune

# Serverless Options

* [S3 + S3 Select](09_s3.md)
* [Athena](07_athena.md)
* [DynamoDB](03_dynamodb.md)
* [Aurora Serverless](??_aurora.md)

# Data Freshness, access and retrieval patterns

### Structure
* Structured
  * Examples
    * accounting
    * demografig
    * logs
    * mobile device geolocation data
  * Storage Options: RDS, Redshift, S3, Data Lake
* Unstructured - No schema
  * Examples
    * Email
    * Text
    * Audio
    * Photos
    * Video
    * PDF
  * Storage Options: S3 (files/binary), DynamoDB (unstructured documents)
* Semi-structured
  * Examples:
    * Metadata (email, photo, video)
    * JSON Data (soft schema)
  * Storage Optiosn: S3 / DynamoDB

### Storaged-related

* Persisted
  * Data that needs to be stored for mid-long-term
  * e.g.: Orders, Credentials, ...
* Transient
  * Data that needs to be accesed quickly but not on long-term
  * e.g.: Cache data, user session, ...

### Latency

Near-real-time
* Example:
  * Ticker data (stock market)
  * Sensors
  * Clockstream
* Services: Kinesis, Elastic Cache, Quicksight

# Data warehouse versus data lake

DWH
* Optmized for relational data producted by transactional systems (OLTP databases)
* Schema on write - schema is predefined, making it faster to retrieve later
* Operational reporting
* Usually, tied to keeping a cluster up & running (which infer on high-costs if not used)

DataLake
* Relational and Non-Relational Data
* Schema on Read - Schema is not defined during write, the querying defines where to look for data (making it more flexible but generally slower)
* Optimal for Big-data Analysis (from multiple dirty unstructured sources), ML, ...

# Layout, schema structure and format
# Lifecycle, usage patterns and business requirements
# Metadata
