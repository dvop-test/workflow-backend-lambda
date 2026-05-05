#!/bin/sh

.PHONY: create.lambda \

## FUNTIONS ##
define create.zip
	@echo "Creating Lambda function..."
endef

# ##################################################################
# #### creation of lambda resources
# ##################################################################

create.lambda: # create.lambda: creacion del recurso de lambda
	$(call create.zip)