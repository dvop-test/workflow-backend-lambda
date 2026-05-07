.PHONY: update.lambda \

## FUNTIONS ##
define create.zip
	@echo "---- Empaquetando desde $(LAMBDA_ROOT) ----"
	cd $(LAMBDA_ROOT)/dist && zip -j lambda.zip index.js
	@if [ ! -f $(LAMBDA_ROOT)/dist/lambda.zip ]; then \
		echo "::error::Error: No se encontró el archivo lambda.zip tras la ejecución."; \
		exit 1; \
	fi
	@if [ ! -s $(LAMBDA_ROOT)/dist/lambda.zip ]; then \
		echo "::error::Error: El archivo lambda.zip está vacío (0 bytes)."; \
		exit 1; \
	fi
	@echo "——— Validación exitosa: Archivo generado correctamente ———"
endef

# ##################################################################
# #### Creation of lambda resources
# ##################################################################

update.lambda: # update.lambda: actualizacion de la funcion lambda
	$(call create.zip)