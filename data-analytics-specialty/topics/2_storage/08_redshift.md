# Amazon Redshift

Amazon Redshift is a data warehouse product which forms part of the larger cloud-computing platform Amazon Web Services. The name means to shift away from Oracle, red being an allusion to Oracle, whose corporate color is red and is informally referred to as "Big Red.

## Origins

Fork of Postgres, made into columnar store which allows massive parallel processing. Given a query, each row of a table can be queried in parallel with its individual filtering attributes and return much faster than a regular row-based store engine.

## Traits

* Columnar storage
* Data replicated within the cluster itself
* Backups up to S3
* Cluster
  * 1 leader node
    * Builds execution plans to execute database operations - complex queries
    * Compiles code and distributes it to the compute nodes assigning data portion
  * 1 or more compute nodes
    * Execute code
    * Sends back intermediate results for the leader node to aggregate
   * Dedicated CPU/Memory/Disk determined by the NodeType
   * Slices
     * Partiton of the node memory and disk space
     * Used to process queries in parallel
     * Leader sends commands directly to slices

## Usecase

* Data-science
* Business Intelligence

# Integration

* S3
  * You can copy data from S3
* DynamoDB
  * Copy command to copy an entire dynamo table
* EMR
  * Load data from SSH
* Data Pipeline
  * Automate and schedule recurring jobs
* DMS
  * Migrate data in or out of Redshift
