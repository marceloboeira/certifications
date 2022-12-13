DOCKER ?= `which docker`
TF ?= `which terraform`
TF_FOLDER ?= `pwd`/terraform

.PHONY: compose
compose: ## Starts up consul servers via docker
	@$(DOCKER) compose up

.PHONY: tf
tf: tf_init tf_apply ## Runs end-to-end workflow to update infra

.PHONY: tf_init
tf_init: ## Configures terraform
	@cd $(TF_FOLDER); $(TF) init -upgrade

.PHONY: tf_lock
tf_lock: ## Locks terraform dependencies
	@cd $(TF_FOLDER); $(TF) providers lock -platform=linux_arm64 -platform=linux_amd64  -platform=darwin_amd64

.PHONY: tf_plan
tf_plan: ## Runs terraform plan
	@cd $(TF_FOLDER); $(TF) plan

.PHONY: tf_apply
tf_apply: ## Apply infra changes
	@cd $(TF_FOLDER); $(TF) apply -auto-approve

.PHONY: help
help: ## Lists help commands
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-36s\033[0m %s\n", $$1, $$2}'
