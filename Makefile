export USER_ID=$(shell id -u)
export GROUP_ID=$(shell id -g)

help: ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

envdev: ## Get EnvDev version
	@cat ./version

profile: ## Create new profile
	@echo '******** Create new profile ********'
	@sh -c scripts/profile.sh

delete: ## Delete profile
	@echo '******** Delete profile ********'
	@sh -c scripts/delete.sh

run: ## Run a profile
	@echo '******** Running a profile **********'
	@sh -c scripts/run.sh

servers: ## Start default containers
	@echo '******** Starting default profile containers... ********'
	@sh -c scripts/servers.sh

start: ## Start default containers
start: servers

stop: ## Stop all containers
	@echo '******** Stopping all containers... ********'
	@docker-compose down --remove-orphans

certificate: ## Generate a SSL certificate
	@echo '******** Generate a SSL certificate ********'
	@docker run -ti --rm -v $(shell pwd)/conf/ssl:/app/ssl vfac/certificates /app/certificate.sh

renewal: ## Renewal a knowed SSL certificate
	@echo '******** Renew a SSL certificate ********'
	@docker run -ti --rm -v $(shell pwd)/conf/ssl:/app/ssl vfac/certificates /app/regenerate_certificate.sh

homepage: ## Launch EnvDev homepage in default browser
	@echo '******** Launch Homepage in browser ********'
	@sh -c scripts/homepage.sh

terminal: ## Create a terminal on PHP container
	@echo '******** Launch terminal ********'
	@docker exec -ti php /bin/bash

terminalroot: ## Create a terminal on PHP container as root
	@echo '******** Launch terminal as root ********'
	@docker exec -ti -u 0 php /bin/bash