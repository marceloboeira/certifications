# Amazon Redshift

Amazon Redshift is a data warehouse product which forms part of the larger cloud-computing platform Amazon Web Services. The name means to shift away from Oracle, red being an allusion to Oracle, whose corporate color is red and is informally referred to as "Big Red.

## Origins

Fork of Postgres, made into columnar store which allows massive parallel processing. Given a query, each row of a table can be queried in parallel with its individual filtering attributes and return much faster than a regular row-based store engine.

## Usecase

* Data-science
* Business Intelligence

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

* Data is rebalanced when nodes are added or removed from the cluster
* Data is mirrored across nodes to make data more durable

### Distribution Modes

* Distribution Key - All entries with the same key are on the same node (the entire row of that specified hashed key)
  * Most efficient if a distribution key is available and it is possible to use
* All - One copy of all the data on each node
  * Better for tables that aren't updated frequently or extensively
* Even - Round robin row-by-row distribution of the data across
  * Table doesn't participate joins or no clear choice for key
  * When you do a join data is moved around, which is expensive

### NodeTypes

* Define CPU/Memory/Storage Capacity
* RA3
  * Compute and Storage are independent
  * Managed Storage
  * SSD for faster access and S3 for long-term
  * Offloads data to S3 once local SSDs are being filled-up with operational data
  * Independent scaling of Compute & Storage
  * High-bandwidth networking
  * Size cluster based on performance needs, growing-quickly data
* DC2
  * Compute-intensive node with local SSD included
  * Compute and Storage bound into node size and number of nodes
  * High-performance
  * Recommended for under 1TB & Best Price-performance
* DS2
  * HDD legacy data type

### Primary Keys / Foreign Keys

* Informational only - not enforced
* Query planner uses to eliminate redundant joins

### Sort Keys

* Rows are stored in order to facilitate sorting/retrieval
* Sort-key is used by the query planner to build plans that benefit from sorting
* Explain command shows impact of sorting
* Type
  * Compound - When query predicates use a prefix, which is a subset of the sort key columns in order, a compound key is more efficient
  * Interleaved - Weight each column in a sort key equally, predicates can use any subset of the columns that make up the sort key, in a y order
    * Not suitable for incremental field, (ID, timestamps)

#### Copy Command

* Most efficient way to load data into a table
* It can read data from multiple files/sources/streams and distribute loading to nodes/slices in order to run everything in parallel
* Can't copy with Redshift Spectrum
* Use VACUUM to reorganize data - reclaim space after deletes

#### Compression Types

Defines the type of compression

* By default
  * Sort keys - RAW
  * Bool, Real, Double - RAW
  * SmallInt, Integer, Big Int, Decimal, Date, Timestam -> AZ64
  * Char, Varchar -> LZO

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
