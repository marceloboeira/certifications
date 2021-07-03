# SQS Test Queue
resource "aws_sqs_queue" "encoding_queue" {
  name                      = "encoding-queue"
  delay_seconds             = 90
  max_message_size          = 1024
  message_retention_seconds = 300
  receive_wait_time_seconds = 10

  tags = {
    Environment = "test"
  }
}
