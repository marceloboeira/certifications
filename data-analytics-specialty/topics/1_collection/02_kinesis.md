# Kinesis Family

## Data Streams

Collect and process large streams of data records in real-time

* Persists data from 24 hours up to 7 days
* Replicates your data synchronously accross 3 AZs in 1 region
* Not suitable for long-term protracted

### Workflow

* Producer - Application creating data for the stream
  * Example producers:
    * Application log files
    * Social media streams
    * IoT Devices
    * Click stream data
    * EC2 Instances
    * Mobile Clients
* Shards
  * Packaging mechanism for distributing data in order in parallel
    * 1 Stream has many shards
      * Default limit of 500
      * Only shard when hitting limits (e.g.: writes/reads/s)
  * Content
    * Partition Key - Identified of the shard
    * Sequence - The order of the record
    * Data - Payload sent by the producer
  * Limits (per shard)
    * 1000 records per second write
    * 1 MB/s write
    * 2 MB/s read
    * Default 24 hours, up to 365 days
* Consumer
  * Example consumers:
    * EC2
    * Lambda
    * Applications
    * Kinesis Data Analytics
    * EMS
    * Firehose

### Pricing

* Shard/Hour cost - 1 shard = 1000 records/s or 1MB/s (whatever comes first)
* PUT payload unit (25KB)
* Extended window incur additional costs

## Firehose

Deliver streaming data to various data sources (S3, Redshift, ES, Splunk...)

### Important
* It does not persist data
* It is able to pre-process data before pushing downstream

* Producers
* Data Records
  * Up to 1000 KB
* Transform
  * Using Lambda

### Destinations:
* S3 (Compression and Encryption are possible)
* Redshift
  * Data is sent to S3 First, then a COPY command is issued by Firehose
  * Records can be transformed before S3 or before Redshift (or both)
* Elasticsearch
* Splunk

### Buffering:

* Buffer Size - Maximal size data can be buffered before being pushed (from 1MB to 128MB for S3)
* Buffer Interval - Max time data is hold before being pushed (60 seconds to 900 seconds)

Buffering ends when either size or interval is achieved

### Pricing

* Per GB of Data Ingested -  e.g.: first 500GB 0.029/GB/month
* Per GB of Data Format Conversion - $0.018
* Per GB processed to VPC - $0.01
* Per Hour, Per AZ delivered to VPC - $0.01

## Analytics

Process and analyse streaming data using SQL Queries.

* Input Stream
  * Data Streams or Firehose
  * S3 can be used to hydrate/join data
* Analytics Application
  * Data can be transformed before the query
  * Query
* Output Stream
  * Data Streams, Firehose or Lambda
  * Both results and errors can be streamed

### Pricing

* Per KPU (Kinesis Unit Process) Per Hour (e.g.: 0.11/h)
* Running Application Storage, Per GB-month (e.g.: 0.10/GB/month)
* Durable Application Backups, Per GB-month (e.g.: 0.023/GB/month)

## Video Streams

Stream video from devices to AWS Cloud.

* Producers
  * Uses Kinesis Video Stream Libs
  * Installed on-device for securely connecting to Kinesis
  * Manages Media-Sources and the Stream life-cycle as data flows
  * Real-time vs Buffered
* Consumer
  * Analyse
    * Real-time - e.g.: EC2, Rekognition (Object Detection)
    * Batch-oriented - e.g.: EC2, Rekognition
  * Store

---------------

## Interacting Kinesis

* KPS - Kinesis Producer Library
  * Helps to implement fault-tolerance
    * Built-in retry logic
    * Rate-limiting
    * Aggregation
  * Provides a layer of abstraction for ingesting data
  * Automatic and configurable retry
  * Uses the Kinesis API (delays might occur)
  * Java Wrapper
* KCL - Kinesis Client Library
  * Integrated with KPL
  * Consume and Process Data from a Stream
* Kinesis Agent
  * Pre-built java application to monitor file and stream changes
* Kinesis API (SDK)
  * API Operations for all platforms
  * Not bound to Java
  * PutRecord/Records
  * Stream creation/resharding/put/get are manually handled
  * No delays in processing
