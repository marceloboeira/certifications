## Data Collection Systems



### Data Analytics Cycle

* Define - Specify the problem, data that needs to be collected
* Interpret - Understand the format/structure
* Clean/Transform - Remove, aggregate and/or sample data accordingly
* Enhance - Hydrate data with combinations or from different sources
* Analyze - Create insights from the data
* Visualize - Plot and make insights easy to understand and share


### Stages of Data Collection

* Determine the operational characteristics of the collection system
  * Streaming operational components
    * Kinesis
    * Kinesis Data Streams/Analytics
    * Lambda for Processing
  * Fault tolerance and data persistence
    * Kinesis Producer/Consumer and Data Streams
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
