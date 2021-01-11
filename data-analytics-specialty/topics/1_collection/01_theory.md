## Data Collection Systems

### Data Analytics Cycle

![cycle](https://github.com/marceloboeira/aws-certifications/blob/master/data-analytics-specialty/topics/1_collection/cycle.png?raw=true)

* Define - Specify the problem, data that needs to be collected
* Interpret - Understand the format/structure
* Clean/Transform - Remove, aggregate and/or sample data accordingly
* Enhance - Hydrate data with combinations or from different sources
* Analyze - Create insights from the data
* Visualize - Plot and make insights easy to understand and share

### Stages of Data Collection

* Select a colleciton system that handles the frequency, volume and source of data
  * Batch, streaming and transictional data
    * AWS Glue
    * DataLakes
    * Athena
    * AWS DMS
  * Compare data collection systems
    * DMS vs Kinesis (DS/FH) vs AWS Glue
* Select a collection system that addresses the key properties of data, such as order, format and compression
  * Order and duplication
  * Transform, aggregate and filter

### 1. Determine Operational Characteristics Of The Collection System

* Streaming operational components
  * Kinesis
    * Data Streams
    * Firehose
    * Analytics
  * Lambda for Processing
* Fault tolerance - Capacity of tolerating failure on one or more records without compromising the entire data ingestion
* Data Persistence - Which type of delivery and persistence is needed for the usecase
  * Firehose vs Data Streams
    * Firehose does not persist/hold data
  * Firehose can process data with lambda before delivery
    * Kinesis Producer/Consumer and Data Streams
* Kinesis Producer Library vs Kinesis API vs Kinesis Agent

### 2. Select A Collection System (frequency, volume, source)

### 3.
