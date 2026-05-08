.PHONY: update.lambda \

## GENERAL ##
PROJECT_NAME_ZIP     			= ${PROJECT_NAME}-${APP_ENV}.zip

## FUNTIONS ##
define create.zip
	@echo "——— Preparando dependencias de producción ———"
	# 1. Borramos dependencias de desarrollo para que el ZIP sea ligero
	@cd $(PROJECT_DIR) && npm prune --production
	
	@echo "——— Empaquetando código y módulos ———"
	# 2. Limpiamos mapas en dist
	@cd $(PROJECT_DIR)/dist && find . -name "*.map" -type f -delete || true
	
	# 3. Creamos el ZIP inicial con el código compilado
	@cd $(PROJECT_DIR)/dist && zip -q -r $(PROJECT_NAME_ZIP) . -x "*.zip"
	
	# 4. Inyectamos la carpeta node_modules al ZIP (está un nivel arriba de dist)
	@cd $(PROJECT_DIR) && zip -q -u -r dist/$(PROJECT_NAME_ZIP) node_modules -x "node_modules/.bin/*"
	
	@if [ ! -f $(PROJECT_DIR)/dist/${PROJECT_NAME_ZIP} ]; then \
		echo "::error::Error: No se encontró el archivo ${PROJECT_NAME_ZIP} tras la ejecución."; \
		exit 1; \
	fi
	@if [ ! -s $(PROJECT_DIR)/dist/${PROJECT_NAME_ZIP} ]; then \
		echo "::error::Error: El archivo ${PROJECT_NAME_ZIP} está vacío (0 bytes)."; \
		exit 1; \
	fi
	@echo "——— Validación exitosa: Archivo generado correctamente ———"
endef

# ##################################################################
# #### Creation of lambda resources
# ##################################################################

update.lambda: # update.lambda: actualizacion de la funcion lambda
	$(call create.zip)