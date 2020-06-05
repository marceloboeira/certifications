# API Gateway

A Web API component to serve traffic as an entrypoint to your other AWS services.

* No need for management
* Scales automatically
* Tracking and control by API-key
* Low-cost
* Recipes available to connect easily with other AWS components such as Lambda Functions, DynamoDB, S3, EC2...
* Throttle requests to prevent attacks
* Versioning
* You can use custom Domain
* You get SSL certificates for free
* API Caching available
* Same-Origin-Policy
  * You can enable CORS when using a different domain than the one serving content on the website
e.g.:

* Rather than configuring a web-server that wraps an S3 Uploader, you could basicaly create an endpoint that users can send their Video Files to your S3 Bucket.
* Rather than configuring a web-server that readers S3 images and adjusts the resolution you could create an API gateway that calls a lambda function that does that... (no deployment, no provisioning*, no 'server management' required.)

## LAB

* Create
