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

