#!/bin/sh

MAX_SLEEP=5
MIN_SLEEP=1
SQS_QUEUE_URL=$1

echo "##### SQS Producer Starting #####"

while true
do
  ENCODING_REQUEST_ID=$(uuidgen)
  SLEEP_TIME=$(jot -r 1 $MIN_SLEEP $MAX_SLEEP)

  echo "Produced New Video Encoding Request: $ENCODING_REQUEST_ID"

  aws sqs send-message --queue-url $SQS_QUEUE_URL --message-body "$ENCODING_REQUEST_ID" &> /dev/null

  sleep "$SLEEP_TIME"
done
