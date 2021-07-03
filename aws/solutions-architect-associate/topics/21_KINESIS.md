# Kinesis

Streaming data is generated continuosly by thousands of sources.

Kinesis is a streaming service provided by Amazon, it provides a simple way to push and pull streaming data continuosly for thousands of sources and targets.

* Shards - like topics, usually an aggregation of similar events or something that needs to be ordered
* Retention of 24 hours or up to 7 days (without having to talk to AWS, but you can get more on demand if you reach out to amazon).
* Reads: 5 transactions per second, up to 2MB/s
* Writes: 1MB/s or 1000 recods

### Types of Kinesis

* Streams - Only shards, persisted for 24 hours up to 1 week ( e.g.: all search queries of a specific product go to a stream for later analysis)
* Firehoses - used for pre-processing (e.g.: K -> Lambda -> S3 -> Redshift, for storing all queries into a data-warehouse for later on Machine Learning usage)
* Analytics - real-time analysis of the previous 2 using SQL (e.g.: monitoring how many searches got 0 results to calculate impact on the business for the day)
