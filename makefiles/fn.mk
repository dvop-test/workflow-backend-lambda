.PHONY: update.lambda \

## FUNTIONS ##
define create.zip
	@echo "---- Empaquetando desde $(PROJECT_DIR) ----"
	cd $(PROJECT_DIR)/dist && zip -j lambda.zip index.js
	@if [ ! -f $(PROJECT_DIR)/dist/lambda.zip ]; then \
		echo "::error::Error: No se encontró el archivo lambda.zip tras la ejecución."; \
		exit 1; \
	fi
	@if [ ! -s $(PROJECT_DIR)/dist/lambda.zip ]; then \
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