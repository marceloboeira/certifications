# SQS
> Simple Queue Service

One of the first AWS Services, a Web Service that provides a message queue to store messages while waiting for computing.

* Distributed
* Extremelly available
* Offer sharding
* Messages can contain up to 256kb (any format)
* HTTP API (Pull-Based)
  * You can use long-poll requests to hold the conneciton open and wait for new messages rather than multiple short-running requests
  * It waits until the regular timeout of the request
* Messages can be kept in the queue from 1 minute up to 14 days, default period 4 days
* Visibility timeout -> how long does the message stays invisible in the queue waiting for worker ACK before it comes back
  * Maximum of 12 hours

## Types of Queue

* Standard
 * At least once delivery
 * Messages can be delivered out of order (no strict guarantee, but generaly delivered ordered)
 * Nearly unlimited messages per second
* FIFO
  * For cases where order matters
  * Exactly once delivery
  * Message groups
  * Limited to 300 TPS (transactions per second)

## Lab

* Create an SQS Queue
* Create a producer script `scripts/sqs_producer.sh`
* Create a consumer script `scripts/sqs_consumer.sh`
  * SQS Consumer Must ACK the messages
* Checkout:
  * Update the SQS URL on the scripts
  * Open one shell and run: `make sqs_producer`
  * Open another shell and run: `make sqs_consumer`
  * Note that you can scale up the number of consumers and producers (the order of the processing is ignored for the example)
