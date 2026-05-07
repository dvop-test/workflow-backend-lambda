.PHONY: update.lambda \

## FUNTIONS ##
define create.zip
	@echo "---- Empaquetando desde $(LAMBDA_ROOT) ----"
	ls -la $(LAMBDA_ROOT)/dist
	cd $(LAMBDA_ROOT)/dist && zip -j lambda.zip index.js
endef

# ##################################################################
# #### Creation of lambda resources
# ##################################################################

update.lambda: # update.lambda: actualizacion de la funcion lambda
	$(call create.zip)