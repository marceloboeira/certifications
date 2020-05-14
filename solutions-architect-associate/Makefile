TF_BIN = `which terraform`
TF_PATH = `pwd`/terraform

.PHONY: init
setup:
	@cd $(TF_PATH); $(TF_BIN) init

.PHONY: plan
plan:
	@cd $(TF_PATH); $(TF_BIN) plan

.PHONY: apply
apply:
	@cd $(TF_PATH); $(TF_BIN) apply
