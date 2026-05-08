.PHONY: update.lambda \

## GENERAL ##
PROJECT_NAME_ZIP     			= ${PROJECT_NAME}-${APP_ENV}

## FUNTIONS ##
define create.zip
	@echo "---- Empaquetando desde $(PROJECT_DIR) ----"
	cd $(PROJECT_DIR)/dist && zip -j ${PROJECT_NAME_ZIP}.zip index.js
	@if [ ! -f $(PROJECT_DIR)/dist/${PROJECT_NAME_ZIP}.zip ]; then \
		echo "::error::Error: No se encontró el archivo ${PROJECT_NAME_ZIP}.zip tras la ejecución."; \
		exit 1; \
	fi
	@if [ ! -s $(PROJECT_DIR)/dist/${PROJECT_NAME_ZIP}.zip ]; then \
		echo "::error::Error: El archivo ${PROJECT_NAME_ZIP}.zip está vacío (0 bytes)."; \
		exit 1; \
	fi
	@echo "——— Validación exitosa: Archivo generado correctamente ———"
endef

# ##################################################################
# #### Creation of lambda resources
# ##################################################################

update.lambda: # update.lambda: actualizacion de la funcion lambda
	$(call create.zip)