# CloudFront

* CDN - Content Delivery Network
* It is a Global Service (not bound by region)
* 2 Modes Available: Web/HTTP & RTMP (Adobe Flash Media, used for streaming)
* Edge Location - Network AccessPoint on a region where content is cached
* Origin - Source of the files or content being distributed, e.g.: S3 Bucket, ELB, EC2 or Route53
* Distribution - Collection of Edge Locations
* Edge Locations are NOT READ ONLY - you can write to them
* CF is able to serve static, streaming and dynamic content, making it suitable for most applications
* CF is able to redirect user / download content from another Edge Location rather than the origin (making it cheaper)
* CF is able to set different path to different origins
* CF is able to set different cache rules based on different origins
* You are able to clear cache TTL (creating an Invalidation) but you are charged for that
* TTL is measured in secconds

### Lab:

* Create a cloud-front distributions
* Assign to the known bucket
* Test index
* Test updating file (cache invalidation should take a while to hit)
* Disable distribution to avoid costs

### More Info

* [Choosing a PriceClass](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PriceClass.html)

> By default, CloudFront responds to requests for your objects based only on performance: objects are served from the edge location for which latency is lowest for that viewer. If you're willing to accept higher latency for your viewers in some geographic regions in return for lower cost, you can choose a price class that doesn't include all CloudFront regions. Although CloudFront will serve your objects only from the edge locations in that price class, it still serves content from the edge location that has the lowest latency among the edge locations in your selected price class. However, some of your viewers, especially those in geographic regions that are not in your price class, may see higher latency than if your content were being served from all CloudFront edge locations. For example, if you choose the price class that includes only the United States and Europe, viewers in Australia and in Asia may experience higher latency than if you choose the price class that includes Australia and Asia.

> If you choose a price class that does not include all edge locations, CloudFront may still occasionally serve requests for your content from an edge location in a region that is not included in your price class. When this happens, you are not charged the rate for the more expensive region from which your objects were served. Instead, you're charged the rate for the least expensive region in your selected price class.

* [Pricing Info](https://aws.amazon.com/cloudfront/pricing/)
