# Moving Data To AWS
> Options and Trade-offs

### The 4 Ws 1H of migration

* Why are we migrating? performance? resiliency? availability? cost?
* What are you migrating? data-lake? hot-data? transactional data?
* Where to? RDS? Redshift? S3?
* When does it need to be done?
* How much? How much data/network? That helps to understand the trade-offs

![data-migration-times](https://github.com/marceloboeira/aws-certifications/blob/master/data-analytics-specialty/topics/1_collection/data-transfer-chart.png?raw=true)

### The 3 Factors

* Network connection - 10Mbps or more
* Amount of data - 500 GB or more
* Method - Managed vs Not Managed


## Direct Connect

* 1 or 10Gbps
* Massive amounts of data
* Continuous migrations (not stale)
* Low-latency access
* [Pricing](https://aws.amazon.com/directconnect/pricing/)
  * Port-hours: how much time do you need the connection? at which speed?
    * 1G = $0.30/hour
    * 10GB = $2.25/hour
    * Varying according to the AWS region
* Data Transfer Fee
  *  IN: $0.00/GB
  *  OUT:  Depends on speed/region -> 0.02/GB

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
