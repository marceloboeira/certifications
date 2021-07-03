# Storage Gateway

It is a service that connects an on-permises software appliance to the cloud to allow secure integration for storage purposes.

* It can be either a VM (software) or a Hardware on your own cluster that makes the bridge between you and AWS.


3 different gateways:

* File Gateway:
  * NFS & SMB
  * Stored as objects on your S3 buckets
  * Accessed via NFS, once transfered can be managed as S3 native objects (with versioning, lifecycle management and such)
* Volume Gateway:
  * iSCSI protocol
  * Data written to these volumes is asynchronously backed up as snapshots, stored on EBS
  * The snapshots are incremental diffs of the changed blocks on your volumes
  * Two possibilities:
    * Stored Volumes
      * Entire data-set
      * Low latency
      * Stored on S3 as EBS Snapshots
      * 1GB to 16TB
    * Cached Volumes
      * Same as before except for:
        * Only doing most frequently used data
        * Minimizes the need for scale
        * Up to 32 TB
        * 1GB to 32TB
* Taped Gateway
  * VTL interface that provides a secure way to backup your data
  * Supported by NetBackup, Backup Exec, ...
