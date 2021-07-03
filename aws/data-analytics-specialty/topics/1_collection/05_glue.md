# AWS Glue

* Based on Apache Sparks
* Batch Oriented
* Micro-batches but no streaming
* Does not support NoSQL databases
* Crawl data source to populate a data catalog
* Generate a script to transform data or write your own in console/API
* Run jobs on demand of via trigger event

### Limits

It scales via DPU

### Error handling

* Glue has a 3 time retry handling
* It can trigger a cloudwatch event / SNS

### Pricing

* Hourly rate at a billing per second for both crawlers and ETL jobs
* Monthly fee for storing and accessing data in your Glue data catalog
  * Free for the first million objects then $1 per 100k objects above 1M per month
  * Free for the first million requests then $1 per 100k requests above 1M per month
