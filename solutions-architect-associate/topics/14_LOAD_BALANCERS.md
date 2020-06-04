# Load Balancers

A physical or virutal device to manage netowork load between applications/servers.

3 Different types:
  * Applications Load Balancer - [Layer 7](https://en.wikipedia.org/wiki/Network_layer) load balancer, application aware (you can use cookies, request, URL params to identify better load balancing strategies). Best Suited to HTTP/HTTPS.
  * Network Load Balancer - [Layer 4](https://en.wikipedia.org/wiki/Network_layer) lower level, faster, extreme performance, better suited for TCP, low latency. Not so advanced application awareness
  * Classic Load Balancer - Some layer 7 features or strict layer 4 control, less features and eventually deprecated. Cheaper!
    * Returns 504 on application error
    * X-Forwarded-For Header - if you need the IP address of your end user

## LAB

### ELB

1. Create 2 EC2 Instances into the same region but different AZs
1. Create a Classic ELB
1. Test the ELB by hitting the endpoint multiple times (different servers will get the request)
1. Stop one instance
1. Check that the ELB removes the Instance from routing (since the health-check fails)

### ALB

1. Create a target group for WebServer 1
1. Create a target group for WebServer 2
1. Create a listener
1. Create TargetGroup Attachments
1. Create the ALB
1. Check the behavior (and the possibilities for rules and such)

## Sticky Sessions

The ability to bind a specific user (session) to a specific EC2 machine. Imagine that for some reason the HTTP server is not well-distributed and keeps on its own memory info about that user (not on redis or anything) and you need that info to server requests properly. You need to make sure that all requests from such user go to the same EC2 machine.

* Possible to enable on ELB
* ALB supports on the TargetGroup Level

## Cross-Zone Load Balancing

* ELBs are able to send traffic across AZ (for other ELBs?)...

## Path Pattern

* Listener that are based on URL pattern...
  * e.g.:
    * `amazon.com/prime` -> goes to instance-x on region-y
    * `amazon.com/search?q=alexa` -> goes to another instance/region...
