# Amazon DynamoDB

Amazon DocumentDB is a fully managed proprietary NoSQL database service that supports document data structures and MongoDB workloads. As a document database, Amazon DocumentDB makes it easy to store, query, and index JSON data. Amazon DocumentDB is currently available in 14 AWS regions of AWS.

## Traits

* Horizontal scaling
* Data stored without bounds
* High-performance at extreme scale with low cost
* Data Replicated in 3 AZs
* Global-tables for Multi-Region Replication

## Usecase

* High-scale
* AdTech
* Gaming
* Retail
* Banking

## Replication

* AZs-wide
* Region-wide

## Internals

* Tables
  * Collection of Items (rows) with Attributes (columns)
  * Must have a primary key, either:
    * Partition key (hash attribute)
    * Composite primary key
      * Partition key + sort key (range attribute)
      * Allows complex query
  * Unlimited number of rows
  * Max item (row) size is 400 KB
  * Global Tables
    * Each table is placed on a region
    * Replicas can be created cross-region via DynamoDB Streams
    * It propagates changes cross-regions, all replicas are write/read node
    * It uses Last Writer Wins for concurrent update reconciliation
* Indexes
  * Local Secondary Index
    * Same partition key as the default index
    * Different sort key
    * Share provisioned read/write capacity
  * Global Secondary Index
    * Individual and free-of-choice partition
    * Distinct read/write capacity
* Consistency
  * Reads
    * Eventual consistency - Faster/cheaper/less-accurate (default)
    * Strong consistency - Slower/more-expensive/more-accurate
* Capacity
  * On-demand
    * Let AWS decide and provision capacity
  * Provisioned capacity
    * Specify Read (RCU) / Write (WCU) capacity of your application
    * 1 RCU = 1 strongly consistent read or 2 eventually consistent reads per seconds up to 4KB
    * 1 WCU = 1 write per seconds for up to 1 KB
    * AutoScaling

### Partition Keys

* Burst Capacity
  * The total capacity of a table (WCU/RCU) is divided among partitions, if a partition is not using it, it will shift for later use for ocasional burst or spike usage
  * Automatically enabled
  * It retains capacity for 5min
* Adaptive Capacity
  * Automatically enabled
  * Run imbalaced workloads continuosly - Dynamo provisions only the capacity each partition needs, "hot" partitions receive more read or writes

## Cost vs Performance

## DAX
TODO
