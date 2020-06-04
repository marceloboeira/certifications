# AutoScaling

## Components

* Groups - Logical component to place your instances
* Configuration Templates - Instructions to launch new instances (e.g.: AMI-ID, keys, block devices...)
* Scaling Options - Conditions and Types of Scaling

### Scaling Options

* Maintain instance levels at all times
  * If one instance crashes or is manually terminated, another exatcly like it
  * The crash is detected by the health-check
  * If an instance is not healthy it is deleted and another is created
* Scale Manually
  * Same as before, but you manually change the value (from 3 to 2, or from 2 to 100)
* Scale on Schedule
  * You define periods of time when you know traffic will be up, or demand, and amazon scales up and down accordingly
    * e.g.: "every morning we run a TV spot that gets 1M users to the website, by the afternoon the number goes down to 100k"
    * When you know which number of machines are able to support that load, and when the load is coming and going away, that's a good method!
* Scale on Demand
  * You define a metric on which the amount of instances should change
  * Amazon uses metrics to increase/decrease your instances base on load
    * e.g.: "1000 new users enter the website, the servers memory usage is at 90% capacity, scale 3 instances at a time until it reaches 80%"
* Scale Prediction
  * Same as before but aws figures out the metric on which server should be scaled...

### LAB

1. Create the AutoScaling Template
1. Create an AutoScaling Group
1. Create an AutoScaling Policy
1. Set the custom numbers
1. Destroy 1 instance manually
1. See it coming back
1. Maxout CPU of 2 instances `while true; do true; done`
1. See it autoscaling
