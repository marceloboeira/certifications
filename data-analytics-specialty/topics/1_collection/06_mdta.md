# Moving Data To AWS
> Options and Trade-offs

### The 3 Factors

* Network connection - 10Mbps or more
* Amount of data - 500 GB or more
* Method - Managed vs Not Managed

## Direct Connect

* 1 or 10Gbps
* Massive amounts of data
* Continuous migrations (not stale)
* Low-latency access


## Online Data Transfer
> Group of services to transfer data to AWS online

* AWS DataSync
  * S3/EFS/FSx
  * 1 time data migrations OR ongoing
  * FTP/SFTP/FTPS
* S3 Transfer Acceleration
* Kinesis Data Firehose
* Snowcone (Integrates with DataSync)
