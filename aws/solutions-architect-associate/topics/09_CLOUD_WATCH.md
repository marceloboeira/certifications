# Cloud Watch

Monitoring Service to support monitoring your applications and components within AWS.

Things you can monitor:

* Compute
  * ECS Instances
      * CPU
      * Network
      * Disk
        * EBS Volumes
          * Disk IOPS burst
          * IOPS Anomally detection...
  * Autoscaling groups
* Network/CDN
  * HealthCheck
  * CloudFront Latency...

### CloudTrail vs ClouldWatch

CloudTrail records actions and API calls, you can trace-back users/and actions, e.g.: IP-addresses.

* CloudTrail - "Auditing"
* Performance - "Performance"

## Tips

* Standard Monitoring: 5 min resolution
* Detailed Monitoring: 1 min resolution
* Dashboards - Watch global or regional metrics of your AWS infra
* Alarms - Setup alarms from metrics
* Events - Hook your applications to events within AWS platform, e.g.: "all EC2 instances are 80% CPU"
* Logs - Store logs of your applications/aws components
* Encrypted by default
