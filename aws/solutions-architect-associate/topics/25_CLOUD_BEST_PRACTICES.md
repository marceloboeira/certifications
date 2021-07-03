# Cloud Best Practices

## 1. Design for failure and nothing fails

* Avoid Single Points of Failure
* Use Multiple instances instead of one
* Use Multiple AZs to provide robust Availability
* Separate single server applications into multiple tiered applications

## 2. Build security in every layer

* Enable data encryption for data at-rest and in-transit
* Enforce IAM least-privilege principle, e.g.: to guarantee users/roles only have the level they need
* Implement both NACL and Security Groups
* Consider advanced security services and features, e.g.: AWS Shield, Amazon Inspector,...

## 3. Leverage different storage options

* Move static web-assets to S3
* Enable cloud-front to server global traffic
* Store session info on Dynamo, e.g.: to prevent inconsistency across scaling/load-balancing groups
* Use Elastic Cache for common data, e.g.: complex queries that do not require real time results

## 4. Implement Elasticity

* Implement AutoScaling Groups policies
* Architect resiliency to reboot and relaunch
* Leverage services like S3, Dynamo, since they are auto-scalable* and Elastic

## 5. Think parallel

* Scale horizontally, not vertically
* Decouple compute from session/state (e.g.: having databases or cache instances managing session)
* Enable load balancing
* Right-size your infrastructure

## 6. Loose coupling sets you free

* Instead of a single ordered workflow, use multiple queues
* SQS & SNS are good friends
* Leverage existing services rather than writing your own, e.g.: email, metrics, queues, transcoding, ...

## 7. Don't fear constraints

* Rethink traditional architecture constraints
* Need more RAM? what about distributing workload into more instances rather than adding more memory to a single machine?
* Better IOPS for your DB? what about adding a read-replica instead of scaling up the database?
* Response to failure? what about just recreating the entire cluster rather than wasting precious SLA time?
