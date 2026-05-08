.DEFAULT_GOAL := help

## REFERENCIAS ##
include makefiles/fn.mk
include makefiles/setup.mk


## GENERAL ##
APP_ENV 							?= local2

##################################################################
#### Targets Development Commands
##################################################################


## Target Help ##
help:
	@printf "\033[31m%-25s %-40s %s\033[0m\n" "Target" " Help" "Usage"; \
	printf "\033[31m%-25s %-40s %s\033[0m\n"  "------" " ----" "-----"; \
	grep -hE '^\S+:.*## .*$$' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' | sort | awk 'BEGIN {FS = ":"}; {printf "\033[32m%-25s\033[0m %-40s \033[34m%s\033[0m\n", $$1, $$2, $$3}'
	