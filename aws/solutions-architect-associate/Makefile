#################################################################
## Terraform
TF_BIN = `which terraform`
TF_PATH = `pwd`/terraform
TF_VAR_FILE = `pwd`/secrets.tfvars

.PHONY: format
format:
	@cd $(TF_PATH); $(TF_BIN) fmt

.PHONY: init
setup:
	@cd $(TF_PATH); $(TF_BIN) init -var-file=$(TF_VAR_FILE)

.PHONY: plan
plan:
	@cd $(TF_PATH); $(TF_BIN) plan -var-file=$(TF_VAR_FILE)

.PHONY: import
import:
	@cd $(TF_PATH); $(TF_BIN) import -var-file=$(TF_VAR_FILE) $(RESOURCE)

.PHONY: apply
apply:
	@cd $(TF_PATH); $(TF_BIN) apply -var-file=$(TF_VAR_FILE)

#################################################################
## SQS Scripts
SQS_QUEUE_URL="https://sqs.eu-central-1.amazonaws.com/436791802080/encoding-queue"

.PHONY: sqs_producer
sqs_producer:
	@scripts/sqs_producer.sh $(SQS_QUEUE_URL)

.PHONY: sqs_consumer
sqs_consumer:
	@scripts/sqs_consumer.sh $(SQS_QUEUE_URL)
