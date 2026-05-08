.PHONY: env-setup \

VARS_TO_EXPORT = APP_ENV

# ##################################################################
# #### Setup Environment
# ##################################################################

env-setup: # env-setup: setup del entorno de desarrollo
	@echo "--- Cargando variables del Proyecto Hijo al GITHUB_ENV ---"
	@$(foreach var,$(VARS_TO_EXPORT), \
		echo "$(var)=$($(var))" >> $${GITHUB_ENV} ; \
		echo "Exportada: $(var)=$($(var))" ; \
	)