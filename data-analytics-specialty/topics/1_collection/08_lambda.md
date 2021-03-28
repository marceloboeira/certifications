# Lambda

Things to notice

* Events carry event

### Use-case

* Real-time processing/transformation
* Creating ETL pipelines (piping, not necessairly processing)
* Creating cronjobs (triggers)

### Limits

* 15min (900 seconds) function invocation time
* 6MB sync and 256KB async payloads (request/response)
* Invocation Frequency Per Region (req/s)
  * 10 x concurrent executions
    * synchronous - all sources
    * async - non-AWS sources
  * Unlimited async - AWS sources

### Scaling

* Mainly by sharding
* With Kinesis there is also the possibility of child/parent shards split

More info:
* [Spliting a shard using Java SDK](https://docs.aws.amazon.com/streams/latest/dev/kinesis-using-sdk-java-resharding-split.html)
