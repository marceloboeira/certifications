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


## SnowFamily

* Snowcone - Load that through WiFi or Wired and send to AWS. 10GbE
* Snowball - Petabyte-scale data-transport to AWS with import/export to S3
  * Edge - Runs lambda/EC2 AWS IoT Greengrass (for places with no connectivity)
* Snowmobile - Exabyte-scale data transport that uses a secure semi 40-foot shipping container to transfer data to AWS

