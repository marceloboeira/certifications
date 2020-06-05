#!/bin/sh

MAX_SLEEP=3
MIN_SLEEP=1
SQS_QUEUE_URL=$1
SQS_POLL_WAIT_TIME=20

echo "##### SQS Consumer Starting #####"

while true
do
  SLEEP_TIME=$(jot -r 1 $MIN_SLEEP $MAX_SLEEP)
  MESSAGES=$(aws sqs receive-message --queue-url $SQS_QUEUE_URL --output json --wait-time-seconds $SQS_POLL_WAIT_TIME)

  ENCODING_REQUEST_ID=$(echo $MESSAGES | jq ".Messages[0] | .Body")
  RECEIPT_HANDLE=$(echo $MESSAGES | jq ".Messages[0] | .ReceiptHandle")

  echo "Processing: $ENCODING_REQUEST_ID"

  sleep "$SLEEP_TIME"

  aws sqs delete-message --queue-url $SQS_QUEUE_URL --receipt-handle $RECEIPT_HANDLE  &> /dev/null

  echo "Acknowledging: $ENCODING_REQUEST_ID"
done
