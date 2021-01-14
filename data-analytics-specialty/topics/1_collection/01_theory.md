# Data Collection Systems

## Data Analytics Cycle

![cycle](https://github.com/marceloboeira/aws-certifications/blob/master/data-analytics-specialty/topics/1_collection/cycle.png?raw=true)

* Define - Specify the problem, data that needs to be collected
* Interpret - Understand the format/structure
* Clean/Transform - Remove, aggregate and/or sample data accordingly
* Enhance - Hydrate data with combinations or from different sources
* Analyze - Create insights from the data
* Visualize - Plot and make insights easy to understand and share

## Stages of Data Collection

* Streaming operational components
  * Kinesis
    * Data Streams, Firehose, Analytics
  * Lambda for Processing
  * Fault tolerance - Capacity of tolerating failure on one or more records without compromising the entire data ingestion
* Select a colleciton system that handles the frequency, volume and source of data
  * Batch, streaming and transictional data
    * AWS Glue, Athena, AWS DMS
  * Compare data collection systems
    * DMS vs Kinesis (DS/FH) vs AWS Glue
* Select a collection system that addresses the key properties of data, such as order, format and compression
  * Order and duplication
  * Transform, aggregate and filter

## Data Ingestion

* Batch data
  * Application logs, video files, audio files
  * Larger payloads, hourly/daily/monthly...
  * Aggregated data, "colder" than streaming
  * Services like Glue
* Streaming
  * Continuous flow of data, IoT Sensors, stock market, click-stream, live-video...
  * Live Event / Real-time
  * Small payloads, large throughput
  * "Hottest" of the 3, considering its real-timeness and low-latency (ms)
  * Services like Kinesis Data Streams/Firehose
* Transactional
  * Initial load and continuous updates from data-stores
  * Similar to batch data but with a continuous flow
  * Services like DMS

## Ingestion Services

1. [Kinesis Data Streams](02_kinesis.md#datastreams) - Real-time data ingestion
    1. [MSK](03_msk.md)
1. [Kinesis Firehose](02_kinesis.md#firehose) - Piping data to different sins with a latency of 60 seconds of mor
1. [AWS Database Migration Service](04_dms.md) - For one-time migration and/or continuous database replication to AWS
    1. [Moving Data to AWS](06_mdta.md) - Moving large datasets to AWS
1. [AWS Glue](05_glue.md) - Use-cases needing ETL batch-oriented jobs
