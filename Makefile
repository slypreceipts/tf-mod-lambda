CURRENT_DIR = $(shell pwd)

###############
# GIT TARGETS #
###############


#####################
# TERRAFORM TARGETS #
#####################
tf.doc:
	docker run --volume "$(CURRENT_DIR)/terraform:/terraform-docs" quay.io/terraform-docs/terraform-docs:0.16.0 markdown table --output-file README.md --output-mode inject /terraform-docs;

tf.lint:
	docker run --rm -v $(CURRENT_DIR)/terraform:/data -t ghcr.io/terraform-linters/tflint; \
	docker run --tty --volume $(CURRENT_DIR)/terraform:/tf --workdir /tf bridgecrew/checkov --directory /tf; \

